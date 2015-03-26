SQL Documentation:
  - W3Schools SQL Tutorials: <http://www.w3schools.com/sql/default.asp>  
  - MySQL Database Manipulation Docuemntaion: <http://dev.mysql.com/doc/refman/5.7/en/sql-syntax-data-manipulation.html>
  
Database Tables:

  users:
    user_id : INTEGER (Primary Key, Auto Incrementing) - User identification number 
    email : VARCHAR(255) - User's email address
    account_type : VARCHAR(11) (Must be one of the following => [peer mentor|student|teacher|admin] ) - Specifies user's account type  
    passwd : VARCHAR(40) (Must be greater than 8 characters) - User's password
    first_name : TEXT (Not Null) - User's first name.
    last_name : TEXT (Not Null) - User's last name.

  instructor_info:
    user_id : INTEGER (Foreign Key, References users(id)) - User identification number 
	office : TEXT - Location of instructor's office
	phone_number : INTEGER - The instructor's phone number

  classes:
    class_id : NUMERIC (Primary Key, Auto Incrementing) - Class identification number
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
    
  assignment_storage: 
    assignment_data : 
    assignment_id : INTEGER(5) (NOT NULL, AUTO_INCREMENT, PRIMARY KEY) - represent's the assignment's id
    user_id : INTEGER (REFERENCES users(user_id)) - represent's a user's id
    class_id : INTEGER (REFERENCES classes(class_id)) - represent's a class's identification number
    assignment_des : TEXT - describes the text assignment created by the user
    assignment_name : TEXT (NOT NULL) - name of the text assignment created by the user
    

