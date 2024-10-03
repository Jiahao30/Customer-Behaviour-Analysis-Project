USE customer_engagement;

SELECT
	course_id,
    course_title,
    ROUND(minutes_total, 2) AS minutes_watched,
	ROUND(minutes_avg, 2) AS minutes_per_student,
    ROUND(minutes_avg / course_duration, 2) AS completition_rate
FROM
	(SELECT
		*
	FROM course_info c
	JOIN
		(SELECT
			course_id,
			COUNT(student_id) AS student_total,
			SUM(minutes_watched) AS minutes_total,
			SUM(minutes_watched) / COUNT(DISTINCT student_id) AS minutes_avg
		FROM student_learning
		GROUP BY course_id) s
	USING(course_id)) a