USE customer_engagement;
SELECT
	course_id,
    AVG(course_rating) AS course_rating
FROM course_ratings
GROUP BY course_id
ORDER BY course_id;