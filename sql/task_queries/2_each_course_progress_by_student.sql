\c :database_name;

WITH course_lessons_count AS (
    SELECT
        course.course_id AS id,
        count(lesson_id) AS lessons_count
    FROM
        course
        JOIN course_lesson USING(course_id)
    GROUP BY
        course.course_id
)
SELECT
    student.name AS student,
    course.title AS course,
    COUNT(student_completed_lesson.lesson_id) AS completed,
    MAX(course_lessons_count.lessons_count) AS total,
    ROUND(
        100 * (
            COUNT(student_completed_lesson.lesson_id) / MAX(course_lessons_count.lessons_count) :: numeric
        ),
        2
    ) AS percentage
FROM
    student_course
    LEFT JOIN student using(student_id)
    LEFT JOIN course USING(course_id)
    LEFT JOIN course_lesson using(course_id)
    LEFT JOIN student_completed_lesson using(student_id, lesson_id)
    LEFT JOIN course_lessons_count ON course_lessons_count.id = course.course_id
GROUP BY
    student.student_id,
    course.course_id
ORDER BY
    student.student_id,
    course.course_id;