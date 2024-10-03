USE customer_engagement;

SELECT
	student_id,
    date_registered,
    IF(onboarded_times IS NULL, 0, 1) AS student_onboarded
FROM
	(SELECT *
	FROM student_info a
	LEFT JOIN
	(SELECT
		student_id,
		COUNT(*) AS onboarded_times
	FROM student_engagement
	GROUP BY student_id) b
	USING(student_id)
    ) c;