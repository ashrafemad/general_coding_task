
\c :database_name;

CREATE TABLE IF NOT EXISTS course (
    course_id SERIAL PRIMARY KEY,
    title VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS teacher (
    teacher_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS student (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS teacher_course (
    teacher_id integer REFERENCES teacher,
    course_id integer REFERENCES course,
    UNIQUE (teacher_id, course_id)
);

CREATE TABLE IF NOT EXISTS course_lesson (
    lesson_id SERIAL PRIMARY KEY,
    course_id integer REFERENCES course,
    title VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS student_course (
    student_id integer REFERENCES student,
    course_id integer REFERENCES course,
    UNIQUE (student_id, course_id)
);

CREATE TABLE IF NOT EXISTS student_completed_lesson (
    student_id integer REFERENCES student,
    lesson_id integer REFERENCES course_lesson,
    UNIQUE (student_id, lesson_id)
);