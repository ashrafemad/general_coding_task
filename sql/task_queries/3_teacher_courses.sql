\c :database_name;

SELECT
    teacher.name,
    STRING_AGG(course.title, ', ') AS courses
FROM
    teacher_course
    JOIN teacher using(teacher_id)
    JOIN course using(course_id)
GROUP BY
    teacher.teacher_id
ORDER BY
    teacher.name;
