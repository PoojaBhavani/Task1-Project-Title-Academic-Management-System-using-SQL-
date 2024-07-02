CREATE Database SQLTask1;
USE SQLTask1;
CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(255),
    DOB DATE,
    PHONE_NO VARCHAR(20),
    EMAIL_ID VARCHAR(255),
    ADDRESS VARCHAR(255)
);
select * from StudentInfo;
CREATE TABLE CoursesInfo(
COURSE_ID INT PRIMARY KEY,
COURSE_NAME VARCHAR(255),
COURSE_INSTRUCTOR_NAME VARCHAR(255)
);
SELECT * FROM CoursesInfo;
CREATE TABLE EnrollmentInfo(
ENROLLMENT_ID INT PRIMARY KEY,
STU_ID INT,
COURSE_ID INT,
ENROLL_STATUS VARCHAR(255),
FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);
SELECT * FROM EnrollmentInfo;

INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) VALUES
(1, 'SOUJANYA', '2000-05-27', '9797979797', 'soujanya@gmail.com', '27-BHAVANIPURAM'),
(2, 'DIVYA', '1998-12-19', '9696969696', 'divya@gmail.com', '19-DEVI NAGAR');
SELECT * FROM StudentInfo;
INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
    (101, 'MATHEMATICS', 'MR. PRASAD'),
    (102, 'PHYSICS', 'MRS. SMITHA');
    SELECT * FROM coursesInfo;
    INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES
    (1001, 1, 101, 'ENROLLED'),
    (1002, 2, 101, 'ENROLLED'),
    (1003, 2, 102, 'ENROLLED');
    SELECT * FROM EnrollmentInfo;
    
    /*To retrieve student details, including their name, contact information, and enrollment status*/
    SELECT
    s.STU_NAME,
    s.PHONE_NO,
    s.EMAIL_ID,
    e.ENROLL_STATUS
FROM StudentInfo s
JOIN EnrollmentInfo e ON s.STU_ID = e.STU_ID;

/*To retrieve a list of courses in which a specific student (let’s say with STU_ID = 2)*/

SELECT c.COURSE_NAME
FROM CoursesInfo c
JOIN EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
WHERE
    e.STU_ID = 2;
    
/*To retrieve course information, including course name and instructor details*/

SELECT
    c.COURSE_NAME,
    c.COURSE_INSTRUCTOR_NAME
FROM CoursesInfo c;

/*To retrieve course information for a specific course (let’s say with COURSE_ID = 102),*/
SELECT
    c.COURSE_NAME,
    c.COURSE_INSTRUCTOR_NAME
FROM CoursesInfo c
WHERE c.COURSE_ID = 102;

/*To retrieve information for specific courses (let’s say with course IDs 101, 102)*/

SELECT COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_ID IN (101, 102);

/*To retrieve the number of students enrolled in each course*/
SELECT
    c.COURSE_NAME,
    COUNT(e.STU_ID) AS Enrolled_Students
FROM
    CoursesInfo c
LEFT JOIN
    EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY
    c.COURSE_NAME
ORDER BY
    Enrolled_Students DESC;
    
/*To retrieve the list of students enrolled in a specific course (let’s say with COURSE_ID = 101)*/

SELECT
    s.STU_NAME
FROM
    StudentInfo s
JOIN
    EnrollmentInfo e ON s.STU_ID = e.STU_ID
WHERE
    e.COURSE_ID = 101;
    
/*To retrieve the count of enrolled students for each instructor*/
SELECT
    c.COURSE_INSTRUCTOR_NAME,
    COUNT(e.STU_ID) AS Enrolled_Students
FROM
    CoursesInfo c
LEFT JOIN
    EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY
    c.COURSE_INSTRUCTOR_NAME
ORDER BY
    Enrolled_Students DESC;
    
/*To retrieve the list of students who are enrolled in multiple courses*/

SELECT
    s.STU_NAME
FROM
    StudentInfo s
JOIN
    EnrollmentInfo e ON s.STU_ID = e.STU_ID
GROUP BY
    s.STU_NAME
HAVING
    COUNT(DISTINCT e.COURSE_ID) > 1;
/*To retrieve the courses with the highest number of enrolled students (arranged from highest to lowest)*/

SELECT
    c.COURSE_NAME,
    COUNT(e.STU_ID) AS Enrolled_Students
FROM
    CoursesInfo c
LEFT JOIN
    EnrollmentInfo e ON c.COURSE_ID = e.COURSE_ID
GROUP BY
    c.COURSE_NAME
ORDER BY
    Enrolled_Students DESC;


