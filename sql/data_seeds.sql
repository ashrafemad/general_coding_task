\c :database_name;

-- Adding  courses
INSERT INTO
    course (title)
VALUES
    ('Mathematics 101'),
    ('Physics 101'),
    ('History of Art'),
    ('Biology 101'),
    ('Chemistry 101'),
    ('Chemistry 102');

-- Adding  teachers
INSERT INTO
    teacher (name)
VALUES
    ('Dr. Alice Johnson'),
    ('Prof. Bob Smith'),
    ('Dr. Charlie White'),
    ('Dr. Emma Green');

-- Adding  students
INSERT INTO
    student (name)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Brown'),
    ('Emily White'),
    ('Chris Black');

-- Assigning teacher to  course
INSERT INTO
    teacher_course (teacher_id, course_id)
VALUES
    (
        (
            SELECT
                teacher_id
            FROM
                teacher
            WHERE
                name = 'Dr. Alice Johnson'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Mathematics 101'
        )
    ),
    (
        (
            SELECT
                teacher_id
            FROM
                teacher
            WHERE
                name = 'Prof. Bob Smith'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Physics 101'
        )
    ),
    (
        (
            SELECT
                teacher_id
            FROM
                teacher
            WHERE
                name = 'Dr. Charlie White'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'History of Art'
        )
    ),
    (
        (
            SELECT
                teacher_id
            FROM
                teacher
            WHERE
                name = 'Dr. Emma Green'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Biology 101'
        )
    ),
    (
        (
            SELECT
                teacher_id
            FROM
                teacher
            WHERE
                name = 'Dr. Alice Johnson'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Chemistry 101'
        )
    ),
    (
        (
            SELECT
                teacher_id
            FROM
                teacher
            WHERE
                name = 'Dr. Alice Johnson'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Physics 101'
        )
    );

-- Adding Lessons to  course
INSERT INTO
    course_lesson (course_id, title)
VALUES
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Mathematics 101'
        ),
        'Introduction to Algebra'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Mathematics 101'
        ),
        'Calculus Basics'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Mathematics 101'
        ),
        'Advanced Algebra'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Physics 101'
        ),
        'Newtonian Mechanics'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Physics 101'
        ),
        'Quantum Physics'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'History of Art'
        ),
        'Renaissance Art'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'History of Art'
        ),
        'Modern Art'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Biology 101'
        ),
        'Cell Structure'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Biology 101'
        ),
        'Cell Structure 2'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Biology 101'
        ),
        'Genetics Basics'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Chemistry 101'
        ),
        'Organic Chemistry'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Chemistry 101'
        ),
        'Inorganic Chemistry'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Chemistry 102'
        ),
        'Bio Chemistry'
    ),
    (
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Chemistry 102'
        ),
        'Bio Chemistry 2'
    );

-- Enrolling student in  course
INSERT INTO
    student_course (student_id, course_id)
VALUES
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'John Doe'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Mathematics 101'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Jane Doe'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Physics 101'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Michael Brown'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'History of Art'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Emily White'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Biology 101'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Chris Black'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Chemistry 101'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'John Doe'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Physics 101'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Michael Brown'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Biology 101'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'John Doe'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Chemistry 101'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'John Doe'
        ),
        (
            SELECT
                course_id
            FROM
                course
            WHERE
                title = 'Chemistry 102'
        )
    );

--  student Completing Lessons
INSERT INTO
    student_completed_lesson (student_id, lesson_id)
VALUES
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'John Doe'
        ),
        (
            SELECT
                lesson_id
            FROM
                course_lesson
            WHERE
                title = 'Introduction to Algebra'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Jane Doe'
        ),
        (
            SELECT
                lesson_id
            FROM
                course_lesson
            WHERE
                title = 'Newtonian Mechanics'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Michael Brown'
        ),
        (
            SELECT
                lesson_id
            FROM
                course_lesson
            WHERE
                title = 'Renaissance Art'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Emily White'
        ),
        (
            SELECT
                lesson_id
            FROM
                course_lesson
            WHERE
                title = 'Cell Structure'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Chris Black'
        ),
        (
            SELECT
                lesson_id
            FROM
                course_lesson
            WHERE
                title = 'Organic Chemistry'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'John Doe'
        ),
        (
            SELECT
                lesson_id
            FROM
                course_lesson
            WHERE
                title = 'Calculus Basics'
        )
    ),
    (
        (
            SELECT
                student_id
            FROM
                student
            WHERE
                name = 'Michael Brown'
        ),
        (
            SELECT
                lesson_id
            FROM
                course_lesson
            WHERE
                title = 'Cell Structure'
        )
    );
