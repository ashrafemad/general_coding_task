\c :database_name;

SELECT
    student.student_id,
    student.name
FROM
    course
    JOIN student_course USING(course_id)
    JOIN student USING(student_id)
WHERE
    course.title = 'History of Art'
ORDER BY
    student.student_id;