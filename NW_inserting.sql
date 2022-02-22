INSERT INTO `northwind_dw`.`dim_customers`
(`customer_key`,
`company`,
`last_name`,
`first_name`,
`job_title`,
`business_phone`,
`fax_number`,
`address`,
`city`,
`state_province`,
`country_region`)
SELECT `id`,
`company`,
`last_name`,
`first_name`,
`job_title`,
`business_phone`,
`fax_number`,
`address`,
`city`,
`state_province`,
`country_region`
FROM northwind.customers;

SELECT * FROM northwind_dw.dim_customers;


INSERT INTO `northwind_dw`.`dim_employees`
(`employee_key`,
`company`,
`last_name`,
`first_name`,
`email_address`,
`job_title`,
`business_phone`,
`home_phone`,
`fax_number`,
`address`,
`city`,
`state_province`,
`country_region`)
SELECT `employees`.`id`,
    `employees`.`company`,
    `employees`.`last_name`,
    `employees`.`first_name`,
    `employees`.`email_address`,
    `employees`.`job_title`,
    `employees`.`business_phone`,
    `employees`.`home_phone`,
    `employees`.`fax_number`,
    `employees`.`address`,
    `employees`.`city`,
    `employees`.`state_province`,
    `employees`.`country_region`
FROM `northwind`.`employees`;

SELECT * FROM northwind_dw.dim_employees;


INSERT INTO `northwind_dw`.`dim_products`
(`product_key`,
`product_code`,
`product_name`,
`standard_cost`,
`list_price`,
`reorder_level`,
`target_level`,
`quantity_per_unit`,
`minimum_reorder_quantity`,
`category`)
SELECT `products`.`id`,
    `products`.`product_code`,
    `products`.`product_name`,
    `products`.`standard_cost`,
    `products`.`list_price`,
    `products`.`reorder_level`,
    `products`.`target_level`,
    `products`.`quantity_per_unit`,
    `products`.`minimum_reorder_quantity`,
    `products`.`category`
FROM `northwind`.`products`;

SELECT * FROM northwind_dw.dim_products;


INSERT INTO `northwind_dw`.`dim_shippers`
(`shipper_key`,
`company`,
`address`,
`city`,
`state_province`,
`zip_postal_code`,
`country_region`)
SELECT `shippers`.`id`,
    `shippers`.`company`,
    `shippers`.`address`,
    `shippers`.`city`,
    `shippers`.`state_province`,
    `shippers`.`zip_postal_code`,
    `shippers`.`country_region`
FROM `northwind`.`shippers`;

SELECT * FROM northwind_dw.dim_shippers;

INSERT INTO `northwind_dw`.`fact_orders`
(`order_id`,
`employee_id`,
`customer_id`,
`product_id`,
`shipper_id`,
`ship_name`,
`ship_address`,
`ship_city`,
`ship_state_province`,
`ship_zip_postal_code`,
`ship_country_region`,
`quantity`,
`order_date`,
`shipped_date`,
`unit_price`,
`discount`,
`shipping_fee`,
`taxes`,
`payment_type`,
`paid_date`,
`tax_rate`,
`order_status`,
`order_details_status`)
SELECT `orders`.`id`,
    `orders`.`employee_id`,
    `orders`.`customer_id`,
    `order_details`.`product_id`,
    `orders`.`shipper_id`,
    `orders`.`ship_name`,
    `orders`.`ship_address`,
    `orders`.`ship_city`,
    `orders`.`ship_state_province`,
    `orders`.`ship_zip_postal_code`,
    `orders`.`ship_country_region`,
    `order_details`.`quantity`,
    `orders`.`order_date`,
    `orders`.`shipped_date`,
    `order_details`.`unit_price`,
    `order_details`.`discount`,
    `orders`.`shipping_fee`,
    `orders`.`taxes`,
    `orders`.`payment_type`,
    `orders`.`paid_date`,
    `orders`.`tax_rate`,
    `orders_status`.`status_name` AS `order_status`,
    `order_details_status`.`status_name` AS `order_details_status`
    FROM `northwind`.`orders` 
    INNER JOIN `northwind`.`orders_status` ON `orders`.`status_id` = `orders_status`.`id`
    RIGHT OUTER JOIN `northwind`.`order_details` ON `orders`.`id` = `order_details`.`order_id`
    INNER JOIN `northwind`.`order_details_status` ON `order_details`.`status_id` = `order_details_status`.`id`;
    

INSERT INTO `northwind_dw`.`dim_customers`
(`customer_key`,
`company`,
`last_name`,
`first_name`,
`job_title`,
`business_phone`,
`fax_number`,
`address`,
`city`,
`state_province`,
`country_region`)

SELECT `dim_customers`.`customer_key`,
    `dim_customers`.`company`,
    `dim_customers`.`last_name`,
    `dim_customers`.`first_name`,
    `dim_customers`.`job_title`,
    `dim_customers`.`business_phone`,
    `dim_customers`.`fax_number`,
    `dim_customers`.`address`,
    `dim_customers`.`city`,
    `dim_customers`.`state_province`,
    `dim_customers`.`country_region`
FROM `northwind_dw`.`dim_customers`;


INSERT INTO `northwind_dw`.`dim_employees`
(`employee_key`,
`company`,
`last_name`,
`first_name`,
`email_address`,
`job_title`,
`business_phone`,
`home_phone`,
`fax_number`,
`address`,
`city`,
`state_province`,
`country_region`)
SELECT `dim_employees`.`employee_key`,
    `dim_employees`.`company`,
    `dim_employees`.`last_name`,
    `dim_employees`.`first_name`,
    `dim_employees`.`email_address`,
    `dim_employees`.`job_title`,
    `dim_employees`.`business_phone`,
    `dim_employees`.`home_phone`,
    `dim_employees`.`fax_number`,
    `dim_employees`.`address`,
    `dim_employees`.`city`,
    `dim_employees`.`state_province`,
    `dim_employees`.`country_region`
FROM `northwind_dw`.`dim_employees`;

INSERT INTO `northwind_dw`.`dim_products`
(`product_key`,
`product_code`,
`product_name`,
`standard_cost`,
`list_price`,
`reorder_level`,
`target_level`,
`quantity_per_unit`,
`minimum_reorder_quantity`,
`category`)
SELECT `dim_products`.`product_key`,
    `dim_products`.`product_code`,
    `dim_products`.`product_name`,
    `dim_products`.`standard_cost`,
    `dim_products`.`list_price`,
    `dim_products`.`reorder_level`,
    `dim_products`.`target_level`,
    `dim_products`.`quantity_per_unit`,
    `dim_products`.`minimum_reorder_quantity`,
    `dim_products`.`category`
FROM `northwind_dw`.`dim_products`;

INSERT INTO `northwind_dw`.`dim_shippers`
(`shipper_key`,
`company`,
`address`,
`city`,
`state_province`,
`zip_postal_code`,
`country_region`)
SELECT `dim_shippers`.`shipper_key`,
    `dim_shippers`.`company`,
    `dim_shippers`.`address`,
    `dim_shippers`.`city`,
    `dim_shippers`.`state_province`,
    `dim_shippers`.`zip_postal_code`,
    `dim_shippers`.`country_region`
FROM `northwind_dw`.`dim_shippers`;

INSERT INTO `northwind_dw`.`fact_orders`
(`order_id`,
`employee_id`,
`customer_id`,
`product_id`,
`shipper_id`,
`ship_name`,
`ship_address`,
`ship_city`,
`ship_state_province`,
`ship_zip_postal_code`,
`ship_country_region`,
`quantity`,
`order_date`,
`shipped_date`,
`unit_price`,
`discount`,
`shipping_fee`,
`taxes`,
`payment_type`,
`paid_date`,
`tax_rate`,
`order_status`,
`order_details_status`)
SELECT `order_details`.`order_id`,
`orders`.`employee_id`,
`orders`.`customer_id`,
`order_details`.`product_id`,
`orders`.`shipper_id`,
`orders`.`ship_name`,
`orders`.`ship_address`,
`orders`.`ship_city`,
`orders`.`ship_state_province`,
`orders`.`ship_zip_postal_code`,
`orders`.`ship_country_region`,
`order_details`.`quantity`,
`orders`.`order_date`,
`orders`.`shipped_date`,
`order_details`.`unit_price`,
`order_details`.`discount`,
`orders`.`shipping_fee`,
`orders`.`taxes`,
`orders`.`payment_type`,
`orders`.`paid_date`,
`orders`.`tax_rate`,
`orders_status`.`status_name` AS `order_status`,
`order_details_status`.`status_name` AS `order_details_status`
FROM `northwind`.`orders`
INNER JOIN `northwind`.`orders_status` ON `orders`.`status_id` = `orders_status`.`id`
    RIGHT OUTER JOIN `northwind`.`order_details` ON `orders`.`id` = `order_details`.`order_id`
    INNER JOIN `northwind`.`order_details_status` ON `order_details`.`status_id` = `order_details_status`.`id`;
