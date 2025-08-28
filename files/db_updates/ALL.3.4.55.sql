-- Add settings-related permissions columns to sma_permissions
ALTER TABLE `sma_permissions`
  ADD COLUMN `categories-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `reports-tax`,
  ADD COLUMN `categories-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `categories-index`,
  ADD COLUMN `categories-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `categories-add`,
  ADD COLUMN `categories-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `categories-edit`,

  ADD COLUMN `brands-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `categories-delete`,
  ADD COLUMN `brands-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `brands-index`,
  ADD COLUMN `brands-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `brands-add`,
  ADD COLUMN `brands-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `brands-edit`,

  ADD COLUMN `customer_groups-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `brands-delete`,
  ADD COLUMN `customer_groups-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `customer_groups-index`,
  ADD COLUMN `customer_groups-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `customer_groups-add`,
  ADD COLUMN `customer_groups-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `customer_groups-edit`,

  ADD COLUMN `price_groups-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `customer_groups-delete`,
  ADD COLUMN `price_groups-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `price_groups-index`,
  ADD COLUMN `price_groups-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `price_groups-add`,
  ADD COLUMN `price_groups-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `price_groups-edit`,

  ADD COLUMN `tax_rates-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `price_groups-delete`,
  ADD COLUMN `tax_rates-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `tax_rates-index`,
  ADD COLUMN `tax_rates-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `tax_rates-add`,
  ADD COLUMN `tax_rates-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `tax_rates-edit`,

  ADD COLUMN `units-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `tax_rates-delete`,
  ADD COLUMN `units-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `units-index`,
  ADD COLUMN `units-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `units-add`,
  ADD COLUMN `units-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `units-edit`,

  ADD COLUMN `variants-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `units-delete`,
  ADD COLUMN `variants-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `variants-index`,
  ADD COLUMN `variants-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `variants-add`,
  ADD COLUMN `variants-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `variants-edit`,

  ADD COLUMN `warehouses-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `variants-delete`,
  ADD COLUMN `warehouses-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `warehouses-index`,
  ADD COLUMN `warehouses-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `warehouses-add`,
  ADD COLUMN `warehouses-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `warehouses-edit`,

  ADD COLUMN `groups-index` TINYINT(1) NOT NULL DEFAULT 0 AFTER `warehouses-delete`,
  ADD COLUMN `groups-add` TINYINT(1) NOT NULL DEFAULT 0 AFTER `groups-index`,
  ADD COLUMN `groups-edit` TINYINT(1) NOT NULL DEFAULT 0 AFTER `groups-add`,
  ADD COLUMN `groups-delete` TINYINT(1) NOT NULL DEFAULT 0 AFTER `groups-edit`;
