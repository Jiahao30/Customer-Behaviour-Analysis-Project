USE customer_engagement;

-- Get the values of 'Enrolled in a track'
SELECT
	'Enrolled in a track' AS action,
	track_id AS track,
    COUNT(*) AS count
FROM student_career_track_enrollments
GROUP BY track_id

UNION

-- Get the values of 'Attempted a course exam'
SELECT 
	'Attempted a course exam' AS action,
    a.track_id AS track,
    COUNT(DISTINCT a.student_id) AS count
FROM student_career_track_enrollments a
LEFT JOIN
    (SELECT DISTINCT 
        se.student_id,
        se.exam_id,
        ei.course_id,
        ct.track_id
    FROM student_exams se
    INNER JOIN
    exam_info ei
    USING(exam_id)
    INNER JOIN career_track_info ct
    USING(course_id)
    WHERE ei.exam_category = 2) b
ON a.student_id = b.student_id
AND a.track_id = b.track_id
WHERE b.course_id IS NOT NULL
GROUP BY a.track_id

UNION

-- Get the values of 'Completed a course exam'
SELECT 
	'Completed a course exam' AS action,
    a.track_id AS track,
    COUNT(DISTINCT a.student_id) AS count
FROM student_career_track_enrollments a
LEFT JOIN
    (SELECT DISTINCT 
        se.student_id,
        se.exam_id,
        ei.course_id,
        ct.track_id
    FROM student_exams se
    INNER JOIN
    exam_info ei
    USING(exam_id)
    INNER JOIN career_track_info ct
    USING(course_id)
    WHERE ei.exam_category = 2
	AND se.exam_passed = 1) b
ON a.student_id = b.student_id
AND a.track_id = b.track_id
WHERE b.course_id IS NOT NULL
GROUP BY a.track_id

UNION

-- Get the values of 'Attempted a final exam'
SELECT
	'Attempted a final exam' AS action,
	ei.track_id AS track,
    COUNT(DISTINCT student_id) AS count
FROM student_exams se
INNER JOIN exam_info ei
USING(exam_id)
WHERE exam_category = 3
GROUP BY ei.track_id

UNION

-- Get the values of 'Earned a career track certificate'
SELECT
	'Earned a career track certificate' AS action,
	ei.track_id AS track,
    COUNT(DISTINCT student_id) AS count
FROM student_exams se
INNER JOIN exam_info ei
USING(exam_id)
WHERE exam_category = 3
AND exam_passed = 1
GROUP BY ei.track_id;