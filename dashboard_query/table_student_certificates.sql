USE customer_engagement;

SELECT
	certificate_id,
    student_id,
    certificate_type,
    date_issued,
    MAX(paid) AS paid
FROM
	(SELECT 
		s.certificate_id,
		s.student_id,
		s.certificate_type,
		s.date_issued,
		CASE
			WHEN date_start IS NULL AND date_end IS NULL THEN 0
			WHEN date_issued BETWEEN date_start AND date_end THEN 1
			WHEN date_issued NOT BETWEEN date_start AND date_end THEN 0
		END AS paid
	FROM student_certificates s
	LEFT JOIN
		purchase_info p
	USING(student_id)) a
GROUP BY certificate_id;