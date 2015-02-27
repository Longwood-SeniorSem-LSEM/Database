SQL Documentation:
  -   
  -
  
Database Tables:

  users:
    id : INTEGER (Primary Key, Auto Incrementing) - User identification number 
    email : VARCHAR(255) - User's email address
    account_type : VARCHAR(11) (Must be one of the following => [peer mentor|student|teacher|admin] ) - Specifies user's account type  

  user_credentials:
    user_id : INTEGER (Foreign Key, References users(id)) - User identification number 
    passwd : VARCHAR(40) (Must be greater than 8 characters) - User's password

  user_info:
    user_id : INTEGER (Foreign Key, References users(id)) - User identification number 
    first_name : TEXT (Not Null) - User's first name.
    last_name : TEXT (Not Null) - User's last name.

  instructor_info:
    user_id : INTEGER (Foreign Key, References users(id)) - User identification number 
	office : TEXT - Location of instructor's office
	phone_number : INTEGER - The instructor's phone number

  classes:
    id : NUMERIC (Primary Key, Auto Incrementing) - Class identification number
    subject : VARCHAR(5) - Specifies the the subject of a class using Longwood's subject abbreviations (i.e CMSC, MATH, LSEM, HIST, etc.)
    course : INTEGER - Specifies the course number (i.e 160, 162, 461 etc.)
    section : INTEGER - The section number of a class.
    title : TEXT - class title

  class_info:
    class_id
    semester : VARCHAR(6) (Must be one of the following => [spring|summer|fall] ) - Specifies the semester in which a class was offeredd
    year : INTEGER (Must be a 4 digit number greater than 2013) - Specifies the year a class was offered
    instructor: INTEGER (Foreign Key, References users(id)) - Represents an instuctor's user id
    class_key: VARCHAR(12) - A unique key given to each class. It is used for registering students for a class, similar to webassign

  rosters:
    user_id : INTEGER (Foreign Key, References users(id)) - Represent's a user's id
    class_id : INTEGER (Foreign Key, References classes(id)) - Represents's an instructor's id
    

Querying the Database:
  1. Find the names and email of all students enrolled in a specific class:
    
      SELECT first_name, last_name, email
      FROM user_info
      INNER JOIN rosters
      ON user_info.user_id = rosters.user_id
      WHERE rosters.class_id = [class id number] 
      AND rosters.account_type = 'student';
    

  2. All courses a student is enrolled in:

      SELECT title, subject, course, section 
	  FROM classes
	  INNER JOIN rosters
	  ON classes.id = rosters.user_id 
	  WHERE rosters.user_id = [user id number];


  3. All courses a student is enrolled in and the instructor for each course.

	   
