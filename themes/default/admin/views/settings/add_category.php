<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('add_category'); ?></h4>
        </div>
        <?php $attrib = ['data-toggle' => 'validator', 'role' => 'form'];
        echo admin_form_open_multipart('system_settings/add_category', $attrib); ?>
        <div class="modal-body">
            <p><?= lang('enter_info'); ?></p>

            <div class="form-group">
                <?= lang('category_code', 'code'); ?>
                <?= form_input('code', set_value('code'), 'class="form-control' . ($Settings->use_code_for_slug ? ' gen_slug' : '') . '" id="code" required="required"'); ?>
            </div>

            <div class="form-group">
                <?= lang('category_name', 'name'); ?>
                <?= form_input('name', set_value('name'), 'class="form-control' . ($Settings->use_code_for_slug ? '' : ' gen_slug') . '" id="name" required="required"'); ?>
            </div>

            <div class="form-group all">
                <?= lang('slug', 'slug'); ?>
                <?= form_input('slug', set_value('slug'), 'class="form-control tip" id="slug" required="required"'); ?>
            </div>

            <div class="form-group all">
                <?= lang('description', 'description'); ?>
                <?= form_input('description', set_value('description'), 'class="form-control tip" id="description" required="required"'); ?>
            </div>

            <div class="form-group">
                <?= lang('category_image', 'image') ?>
            <input id="image" type="file" data-browse-label="<?= lang('browse'); ?>" name="userfile" data-show-upload="false" data-show-preview="false"
                       class="form-control file">
            </div>
            <div class="form-group">
                <?= lang('parent_category', 'parent') ?>
                <?php
                $cat[''] = lang('select') . ' ' . lang('parent_category');
                foreach ($categories as $pcat) {
                    $cat[$pcat->id] = $pcat->name;
                }
                echo form_dropdown('parent', $cat, ($_POST['parent'] ?? ''), 'class="form-control select" id="parent" style="width:100%"')
                ?>
            </div>

        </div>
        <div class="modal-footer">
            <?php echo form_submit('add_category', lang('add_category'), 'class="btn btn-primary"'); ?>
        </div>
    </div>
    <?php echo form_close(); ?>
</div>
<?php if (isset($_FILES['userfile']) && is_array($_FILES['userfile']) && !empty($_FILES['userfile']['name']) && (int)($_FILES['userfile']['size'] ?? 0) > 0) {
    $this->load->library('upload');
    $config['upload_path']   = $this->upload_path;
    $config['allowed_types'] = $this->image_types;
    $config['max_size']      = $this->allowed_file_size;
    $config['overwrite']     = false;
    $config['encrypt_name']  = true;
    $config['max_filename']  = 25;
    $this->upload->initialize($config);
    if (!$this->upload->do_upload()) {
        $error = $this->upload->display_errors();
        $this->session->set_flashdata('error', $error);
        redirect($_SERVER['HTTP_REFERER']);
    }
    $photo         = $this->upload->file_name;
    $data['image'] = $photo;

    // Resize the original image
    $this->load->library('image_lib');
    $resize_config['image_library']  = 'gd2';
    $resize_config['source_image']   = $this->upload_path . $photo;
    $resize_config['maintain_ratio'] = TRUE;
    $resize_config['width']          = $this->Settings->iwidth;
    $resize_config['height']         = $this->Settings->iheight;

    $this->image_lib->clear();
    $this->image_lib->initialize($resize_config);

    if ( ! $this->image_lib->resize())
    {
        $this->session->set_flashdata('error', $this->image_lib->display_errors());
        redirect($_SERVER['HTTP_REFERER']);
    }

    // Create the thumbnail
    $thumb_config['image_library']  = 'gd2';
    $thumb_config['source_image']   = $this->upload_path . $photo;
    $thumb_config['new_image']      = $this->thumbs_path . $photo;
    $thumb_config['maintain_ratio'] = TRUE;
    $thumb_config['width']          = $this->Settings->twidth;
    $thumb_config['height']         = $this->Settings->theight;
    $this->image_lib->clear();
    $this->image_lib->initialize($thumb_config);
    if (!$this->image_lib->resize()) {
        echo $this->image_lib->display_errors();
    }
    if ($this->Settings->watermark) {
        $this->image_lib->clear();
        $wm['source_image']     = $this->upload_path . $photo;
        $wm['wm_text']          = 'Copyright ' . date('Y') . ' - ' . $this->Settings->site_name;
        $wm['wm_type']          = 'text';
        $wm['wm_font_path']     = 'system/fonts/texb.ttf';
        $wm['quality']          = '100';
        $wm['wm_font_size']     = '16';
        $wm['wm_font_color']    = '999999';
        $wm['wm_shadow_color']  = 'CCCCCC';
        $wm['wm_vrt_alignment'] = 'top';
        $wm['wm_hor_alignment'] = 'left';
        $wm['wm_padding']       = '10';
        $this->image_lib->initialize($wm);
        $this->image_lib->watermark();
    }
    $this->image_lib->clear();
    $config = null;
}
?>
<script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<?= $modal_js ?>
<script>
    $(document).ready(function() {
        $('.gen_slug').change(function(e) {
            getSlug($(this).val(), 'category');
        });
    });
</script>
