USE customer_engagement;

SELECT
	si.student_id,
    si.date_registered,
    IF(purchases_times IS NULL, 0, 1) AS f2p,
    IF(sw.total_minutes_watched IS NULL, 0, sw.total_minutes_watched) AS total_minutes_watched,
    CASE
		WHEN total_minutes_watched = 0 OR total_minutes_watched IS NULL THEN '[0]'
        WHEN total_minutes_watched > 0 AND total_minutes_watched <= 5 THEN '(0, 5]'
        WHEN total_minutes_watched > 5 AND total_minutes_watched <= 10 THEN '(5, 10]'
        WHEN total_minutes_watched > 10 AND total_minutes_watched <= 15 THEN '(10, 15]'
        WHEN total_minutes_watched > 15 AND total_minutes_watched <= 20 THEN '(15, 20]'
        WHEN total_minutes_watched > 20 AND total_minutes_watched <= 25 THEN '(20, 25]'
        WHEN total_minutes_watched > 25 AND total_minutes_watched <= 30 THEN '(25, 30]'
        WHEN total_minutes_watched > 30 AND total_minutes_watched <= 40 THEN '(30, 40]'
        WHEN total_minutes_watched > 40 AND total_minutes_watched <= 50 THEN '(40, 50]'
        WHEN total_minutes_watched > 50 AND total_minutes_watched <= 60 THEN '(50, 60]'
        WHEN total_minutes_watched > 60 AND total_minutes_watched <= 70 THEN '(60, 70]'
        WHEN total_minutes_watched > 70 AND total_minutes_watched <= 80 THEN '(70, 80]'
        WHEN total_minutes_watched > 80 AND total_minutes_watched <= 90 THEN '(80, 90]'
        WHEN total_minutes_watched > 90 AND total_minutes_watched <= 100 THEN '(90, 100]'
        WHEN total_minutes_watched > 100 AND total_minutes_watched <= 110 THEN '(100, 110]'
        WHEN total_minutes_watched > 110 AND total_minutes_watched <= 120 THEN '(110, 120]'
        WHEN total_minutes_watched > 120 AND total_minutes_watched <= 240 THEN '(120, 240]'
        WHEN total_minutes_watched > 240 AND total_minutes_watched <= 480 THEN '(240, 480]'
        WHEN total_minutes_watched > 480 AND total_minutes_watched <= 1000 THEN '(480, 1000]'
        WHEN total_minutes_watched > 1000 AND total_minutes_watched <= 2000 THEN '(1000, 2000]'
        WHEN total_minutes_watched > 2000 AND total_minutes_watched <= 3000 THEN '(2000, 3000]'
        WHEN total_minutes_watched > 3000 AND total_minutes_watched <= 4000 THEN '(3000, 4000]'
        WHEN total_minutes_watched > 4000 AND total_minutes_watched <= 6000 THEN '(4000, 6000]'
        WHEN total_minutes_watched > 6000 THEN '6000+'
	END AS buckets
FROM student_info si

LEFT JOIN 

(
SELECT 
	DISTINCT student_id,
    COUNT(student_id) AS purchases_times
FROM student_purchases
GROUP BY student_id
) sp
USING(student_id)

LEFT JOIN

-- Calculate the total minutes watched for the student befor they purchased
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
	WHERE date_first_purchased IS NULL 
		OR date_first_purchased >= date_watched
) a
GROUP BY student_id
) sw
USING(student_id)