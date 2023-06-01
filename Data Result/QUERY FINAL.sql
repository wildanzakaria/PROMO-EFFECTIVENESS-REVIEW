SELECT * FROM buyer_table;
SELECT * FROM marketplace_table;
SELECT * FROM sales_table;
SELECT * FROM seller_table;
SELECT * FROM shipping_table;
-- import tabel promo_code dengan format file csv
CREATE TABLE promo_code(
	promo_id INT PRIMARY KEY,
	promo_name VARCHAR,
	price_deduction INT,
	Description VARCHAR,
	Duration INT
);
COPY promo_code (promo_id, promo_name, price_deduction, Description, Duration)
FROM 'C:\Data Skill 2023\Reporting Engineer Rakamin\final task\promo_code.csv'
DELIMITER ',' CSV HEADER;
SELECT * FROM promo_code;
-- membuat tabel Q3_Q4_Review menggunakan 'CTE' dan 'INSERT with SELECT STATEMENT'
CREATE TABLE Q3_Q4_Review(
	purchase_date DATE,
	total_price INT,
	promo_code VARCHAR,
	discount INT,
	sales_after_promo INT
)
WITH A AS (SELECT sales_table.purchase_date, 
	sales_table.quantity, 
	marketplace_table.price,
	CASE WHEN promo_code.promo_name IS NULL THEN 'TANPA_PROMO' ELSE promo_code.promo_name END AS promo_code, 
	CASE WHEN promo_code.price_deduction IS NULL THEN 0 ELSE promo_code.price_deduction END AS discount
FROM sales_table
LEFT JOIN marketplace_table ON sales_table.item_id = marketplace_table.item_id
LEFT JOIN promo_code ON sales_table.promo_id = promo_code.promo_id
WHERE sales_table.purchase_date >= '2022-07-01' AND sales_table.purchase_date <= '2022-12-31')
INSERT INTO Q3_Q4_Review (purchase_date, total_price, promo_code, discount, sales_after_promo)
SELECT purchase_date, 
	(quantity * price) AS total_price,
	promo_code, 
	discount,
	(quantity * price - discount) AS sales_after_promo
FROM A
SELECT * FROM Q3_Q4_Review;
-- menambahkan kolom promo_ratio pada table Q3_Q4_Review untuk membandingkan jumlah yang menggunakan promo dan tidak
SELECT purchase_date,
	promo_code,
	CASE WHEN promo_code != 'TANPA_PROMO' THEN 'APPLY_PROMO' ELSE promo_code END as promo_ratio,
	total_price,
	sales_after_promo
FROM Q3_Q4_Review
ORDER BY purchase_date;
-- membuat table shipping_summary
CREATE TABLE shipping_summary(shipping_date DATE,
	seller_name VARCHAR,
	buyer_name VARCHAR,
	buyer_address VARCHAR,
	buyer_city VARCHAR,
	buyer_zipcode VARCHAR,
	kode_resi VARCHAR
);
INSERT INTO shipping_summary (shipping_date, seller_name, buyer_name,
buyer_address, buyer_city, buyer_zipcode, kode_resi)
SELECT sh.shipping_date,
	 se.seller_name,
	bu.buyer_name,
	bu.address,
	bu.city,
	bu.zipcode,
	concat(sh.shipping_id, to_char(sh.purchase_date, 'yyyymmdd'), to_char(sh.shipping_date, 'yyyymmdd'), bu.buyer_id, se.seller_id) as kode_resi
FROM shipping_table sh
LEFT JOIN seller_table se ON sh.seller_id=se.seller_id
LEFT JOIN buyer_table bu ON sh.buyer_id=bu.buyer_id
WHERE sh.shipping_date BETWEEN '2022-12-01' AND '2022-12-31';
SELECT * FROM shipping_summary
ORDER BY 1;

