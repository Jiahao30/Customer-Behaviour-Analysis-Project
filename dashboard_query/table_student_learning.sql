USE customer_engagement;

SELECT
	student_id,
	date_watched,
	SUM(minutes_watched) AS minutes_watched, 
	paid
FROM
	(SELECT
		student_id,
		date_watched,
		minutes_watched,
		MAX(paid) AS paid
	FROM
		(SELECT 
			s.student_id,
			s.date_watched,
			s.minutes_watched,
			CASE
				WHEN date_start IS NULL AND date_end IS NULL THEN 0
				WHEN date_watched BETWEEN date_start AND date_end THEN 1
				WHEN date_watched NOT BETWEEN date_start AND date_end THEN 0
			END AS paid,
			p.date_start,
			p.date_end
		FROM student_learning s
		LEFT JOIN
			purchase_info p
		USING(student_id)) a
	GROUP BY student_id, date_watched) b
GROUP BY student_id, date_watched;