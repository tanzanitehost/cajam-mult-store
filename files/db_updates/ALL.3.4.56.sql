-- Add frontend (shop) permissions columns to sma_permissions
ALTER TABLE `sma_permissions`
  -- Pages
  ADD COLUMN `pages-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `groups-delete`,
  ADD COLUMN `pages-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `pages-index`,
  ADD COLUMN `pages-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `pages-add`,
  ADD COLUMN `pages-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `pages-edit`,

  -- Slider
  ADD COLUMN `slider-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `pages-delete`,
  ADD COLUMN `slider-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `slider-index`,

  -- Banners
  ADD COLUMN `banners-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `slider-edit`,
  ADD COLUMN `banners-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `banners-index`,
  ADD COLUMN `banners-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `banners-add`,
  ADD COLUMN `banners-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `banners-edit`,

  -- Menus
  ADD COLUMN `menus-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `banners-delete`,
  ADD COLUMN `menus-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `menus-index`,
  ADD COLUMN `menus-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `menus-add`,
  ADD COLUMN `menus-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `menus-edit`,

  -- Themes
  ADD COLUMN `themes-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `menus-delete`,
  ADD COLUMN `themes-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `themes-index`;
