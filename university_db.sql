-- Active: 1691127538678@@127.0.0.1@5432@test4



--  create students table -- 
    CREATE TABLE IF NOT EXISTS students (
    student_id serial PRIMARY KEY,
    student_name text NOT NULL,
    age integer NOT NULL,
    email text NOT NULL,
    frontend_mark INT NOT NULL,
    backend_mark INT NOT NULL,
    status INTEGER
);

-- courses table --

CREATE TABLE IF NOT EXISTS courses (

    course_id  serial PRIMARY KEY,
    course_name text NOT NULL,
    credits INTEGER NOT NULL
);

-- enrollment table

CREATE TABLE IF NOT EXISTS enrollment (

    enrollment_id serial PRIMARY KEY,

    student_id  INT NOT NULL,
    CONSTRAINT fk_studentId 
        FOREIGN KEY (student_id)
        REFERENCES students (student_id),
        
    course_id   INT NOT NULL,
    CONSTRAINT fk_courseId 
        FOREIGN KEY (course_id)
        REFERENCES courses (course_id)

);
--  table created end --



-- Query 1: Insert a new student record with the following details:
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark)
VALUES 
   ('Bob',21, 'bob@example.com', 24, 45),
   ('Charlie',23, 'charlie@example.com', 24, 45),
   ('Eve',22, 'bob@example.com', 40, 25),
   ('Rahim',25, 'Rahim@example.com', 60, 50);

--   SELECT * from students;

  

--  Query 2:
INSERT INTO courses (course_name, credits)
 VALUES 
 ('Next.js', 3),
 ('React.js', 4),
 ('Database', 3), 
 ('Prisma', 3);

-- SELECT * from courses;

INSERT INTO enrollment (student_id, course_id)
 VALUES 
 (1,1),
 (1,2),
 (2,1),
 (3,2);

SELECT * from enrollment;

SELECT 
    students.student_name
FROM 
    enrollment
JOIN 
    students ON enrollment.student_id = students.student_id
JOIN 
    courses ON enrollment.course_id = courses.course_id
WHERE 
    courses.course_name = 'Next.js';
-- Query 2 END: 





-- Query 3 --


UPDATE students
SET status = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark)
    FROM students
);
-- Query 3 END--


-- Query 4 --

DELETE FROM courses
WHERE course_id NOT IN (SELECT course_id FROM enrollment);
-- Query 4 END--




-- Query 5:


select student_name from students 
 LIMIT 2 OFFSET 1;



--  Query 7:

select AVG(age) as average_age from students;



-- Query 8:
SELECT student_name
FROM students
WHERE email LIKE '%example.com%';

select * from students;