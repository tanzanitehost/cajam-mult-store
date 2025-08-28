#!/usr/bin/env php
<?php
// generate_slider_variants.php
// CLI tool to create responsive width variants for slider images.
// Usage examples:
//   php tools/generate_slider_variants.php --dir=assets/uploads --widths=320,640,1024,1600,2000 --quality=85 --pattern=*.{jpg,jpeg,png}
//   php tools/generate_slider_variants.php --file=assets/uploads/slide1.jpg --widths=640,1024 --overwrite

if (php_sapi_name() !== 'cli') {
    fwrite(STDERR, "This script must be run from the command line.\n");
    exit(1);
}

// --- Arg parsing ---
$args = getopt('', [
    'dir::',
    'file::',
    'widths::',
    'quality::',
    'overwrite::',
    'pattern::',
]);

$dir = rtrim($args['dir'] ?? 'assets/uploads', DIRECTORY_SEPARATOR);
$file = $args['file'] ?? null;
$widths = array_filter(array_map('intval', explode(',', $args['widths'] ?? '320,640,1024,1600,2000')));
$quality = isset($args['quality']) ? (int)$args['quality'] : 85;
$overwrite = filter_var($args['overwrite'] ?? false, FILTER_VALIDATE_BOOLEAN);
$pattern = $args['pattern'] ?? '*.{jpg,jpeg,png,JPG,JPEG,PNG}';

if (empty($widths)) {
    fwrite(STDERR, "No valid widths provided.\n");
    exit(1);
}

$hasImagick = class_exists('Imagick');
$hasGD = function_exists('imagecreatetruecolor');
if (!$hasImagick && !$hasGD) {
    fwrite(STDERR, "Neither Imagick nor GD is available. Enable one of them.\n");
    exit(1);
}

function listFiles(string $dir, ?string $singleFile, string $pattern): array {
    if ($singleFile) {
        return [str_replace(['\\', '/'], DIRECTORY_SEPARATOR, $singleFile)];
    }
    // Glob with brace
    $dir = rtrim($dir, DIRECTORY_SEPARATOR);
    $globPattern = $dir . DIRECTORY_SEPARATOR . $pattern;
    $files = glob($globPattern, GLOB_BRACE) ?: [];
    sort($files);
    return $files;
}

function ensureDir(string $path): void {
    $d = dirname($path);
    if (!is_dir($d)) {
        mkdir($d, 0775, true);
    }
}

function orientationFixGD($img, string $filePath) {
    if (!function_exists('exif_read_data')) return $img;
    $ext = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
    if (!in_array($ext, ['jpg','jpeg'])) return $img;
    $exif = @exif_read_data($filePath);
    if (!$exif || empty($exif['Orientation'])) return $img;
    $orientation = (int)$exif['Orientation'];
    switch ($orientation) {
        case 3: // 180
            $img = imagerotate($img, 180, 0);
            break;
        case 6: // -90
            $img = imagerotate($img, -90, 0);
            break;
        case 8: // 90
            $img = imagerotate($img, 90, 0);
            break;
    }
    return $img;
}

function resizeWithGD(string $src, string $dst, int $targetW, int $quality = 85): bool {
    $info = getimagesize($src);
    if (!$info) return false;
    [$w, $h] = $info;
    $mime = $info['mime'] ?? '';
    switch ($mime) {
        case 'image/jpeg':
            $im = imagecreatefromjpeg($src);
            break;
        case 'image/png':
            $im = imagecreatefrompng($src);
            break;
        default:
            return false;
    }
    if (!$im) return false;

    $im = orientationFixGD($im, $src);

    $ratio = $w > 0 ? $targetW / $w : 1;
    $targetH = (int) round($h * $ratio);

    $dstIm = imagecreatetruecolor($targetW, $targetH);

    // Preserve alpha for PNG
    if ($mime === 'image/png') {
        imagealphablending($dstIm, false);
        imagesavealpha($dstIm, true);
    }

    imagecopyresampled($dstIm, $im, 0, 0, 0, 0, $targetW, $targetH, $w, $h);
    ensureDir($dst);
    $ok = false;
    if ($mime === 'image/jpeg') {
        $ok = imagejpeg($dstIm, $dst, max(1, min(100, $quality)));
    } elseif ($mime === 'image/png') {
        // quality: 0 (no compression) .. 9 (max)
        $pngQ = (int) round((100 - max(1, min(100, $quality))) / 11.1111); // approx map 85 -> 1-2
        $ok = imagepng($dstIm, $dst, max(0, min(9, $pngQ)));
    }
    imagedestroy($dstIm);
    imagedestroy($im);
    return (bool)$ok;
}

function resizeWithImagick(string $src, string $dst, int $targetW, int $quality = 85): bool {
    $img = new Imagick($src);
    // Auto-orient based on EXIF
    if (method_exists($img, 'autoOrient')) { $img->autoOrient(); }
    elseif (method_exists($img, 'autoOrientImage')) { $img->autoOrientImage(); }

    $img->setImageInterlaceScheme(Imagick::INTERLACE_JPEG);
    $img->setImageCompression(Imagick::COMPRESSION_JPEG);
    $img->setImageCompressionQuality(max(1, min(100, $quality)));

    $geo = $img->getImageGeometry();
    $w = $geo['width'] ?? 0;
    $h = $geo['height'] ?? 0;
    if ($w <= 0) return false;
    $ratio = $targetW / $w;
    $targetH = (int) round($h * $ratio);

    $img->resizeImage($targetW, $targetH, Imagick::FILTER_LANCZOS, 1);
    ensureDir($dst);
    $ok = $img->writeImage($dst);
    $img->clear();
    $img->destroy();
    return (bool)$ok;
}

function generateSet(string $path, array $widths, int $quality, bool $overwrite, bool $hasImagick, bool $hasGD): void {
    $ext = strtolower(pathinfo($path, PATHINFO_EXTENSION));
    if (!in_array($ext, ['jpg','jpeg','png'])) {
        echo "Skip unsupported: $path\n";
        return;
    }
    $dir = dirname($path);
    $name = pathinfo($path, PATHINFO_FILENAME);
    $orig = $path;

    foreach ($widths as $w) {
        $dest = $dir . DIRECTORY_SEPARATOR . $name . '-' . $w . '.' . $ext;
        if (!$overwrite && file_exists($dest)) {
            echo "Exists, skip: $dest\n";
            continue;
        }
        if ($hasImagick) {
            $ok = resizeWithImagick($orig, $dest, $w, $quality);
        } elseif ($hasGD) {
            $ok = resizeWithGD($orig, $dest, $w, $quality);
        } else {
            $ok = false;
        }
        echo ($ok ? 'Created' : 'Failed') . ": $dest\n";
    }
}

$targets = listFiles($dir, $file, $pattern);
if (empty($targets)) {
    fwrite(STDERR, "No matching files found.\n");
    exit(2);
}

foreach ($targets as $p) {
    if (!is_file($p)) { echo "Skip (not file): $p\n"; continue; }
    echo "Processing: $p\n";
    generateSet($p, $widths, $quality, $overwrite, $hasImagick, $hasGD);
}

echo "Done.\n";
