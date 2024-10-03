USE customer_engagement;

SELECT
	DISTINCT sp.student_id,
    si.date_registered,
    IF(sw.total_minutes_watched IS NULL, 0, sw.total_minutes_watched) AS total_minutes_watched,
    sp.num_paid_days,
    CASE
		WHEN total_minutes_watched = 0 OR total_minutes_watched IS NULL THEN '[0]'
        WHEN total_minutes_watched > 0 AND total_minutes_watched <= 30 THEN '(0, 30]'
        WHEN total_minutes_watched > 30 AND total_minutes_watched <= 60 THEN '(30, 60]'
        WHEN total_minutes_watched > 60 AND total_minutes_watched <= 120 THEN '(60, 120]'
        WHEN total_minutes_watched > 120 AND total_minutes_watched <= 240 THEN '(120, 240]'
        WHEN total_minutes_watched > 240 AND total_minutes_watched <= 480 THEN '(240, 480]'
        WHEN total_minutes_watched > 480 AND total_minutes_watched <= 1000 THEN '(480, 1000]'
        WHEN total_minutes_watched > 1000 AND total_minutes_watched <= 2000 THEN '(1000, 2000]'
        WHEN total_minutes_watched > 2000 AND total_minutes_watched <= 3000 THEN '(2000, 3000]'
        WHEN total_minutes_watched > 3000 AND total_minutes_watched <= 4000 THEN '(3000, 4000]'
        WHEN total_minutes_watched > 4000 AND total_minutes_watched <= 6000 THEN '(4000, 6000]'
        WHEN total_minutes_watched > 6000 THEN '6000+'
	END AS buckets
FROM student_purchases sp

LEFT JOIN student_info si
USING(student_id)

LEFT JOIN

-- Calculate the total minutes watched for the student who purchased
(
SELECT
	student_id,
    ROUND(SUM(minutes_watched), 2) AS total_minutes_watched
FROM
(
SELECT
	student_id,
    minutes_watched,
    date_watched,
    date_first_purchased
FROM
	student_learning sl
LEFT JOIN
	(
	SELECT
		student_id,
		MIN(date_purchased) AS date_first_purchased
	FROM student_purchases
	GROUP BY student_id
	) sp
	USING(student_id)
	WHERE date_first_purchased <= date_watched
) a
GROUP BY student_id
) sw
USING(student_id)

LEFT JOIN

-- Calculate the duration from first purchased day to date(2022-10-31)
(	
SELECT
	student_id,
	DATEDIFF(date_last_paid, date_first_paid) AS num_paid_days
FROM
(
SELECT 
	student_id,
	MIN(date_start) AS date_first_paid,
	IF(MAX(date_end) <= '2022-10-31',
		MAX(date_end),
		'2022-10-31') AS date_last_paid
FROM
	purchase_info
GROUP BY student_id
) pd
) sp
USING(student_id)