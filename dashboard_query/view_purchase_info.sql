DROP VIEW IF EXISTS purchase_info;
CREATE VIEW purchase_info AS
SELECT
	purchase_id,
    student_id,
    purchase_type,
    date_start,
	IF(date_refunded IS NULL, date_end, date_refunded) as date_end
FROM
	(SELECT
		purchase_id,
		student_id,
		purchase_type,
		date_purchased as date_start,
		CASE
			WHEN purchase_type = 0
				THEN DATE_ADD(MAKEDATE(YEAR(date_purchased), DAY(date_purchased)),
					INTERVAL MONTH(date_purchased) MONTH)
			WHEN purchase_type = 1 
				THEN DATE_ADD(MAKEDATE(YEAR(date_purchased), DAY(date_purchased)),
					INTERVAL MONTH(date_purchased)+2 MONTH)
			WHEN purchase_type = 2 
				THEN DATE_ADD(MAKEDATE(YEAR(date_purchased), DAY(date_purchased)),
					INTERVAL MONTH(date_purchased)+11 MONTH)
		END as date_end,
		date_refunded
	FROM student_purchases) a;
    
SELECT * FROM purchase_info;