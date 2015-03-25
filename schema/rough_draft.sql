DROP TABLE IF EXISTS assignment_submission CASCADE ;
DROP TABLE IF EXISTS assignment_info CASCADE ;
DROP TABLE IF EXISTS assignments CASCADE ;

DROP TABLE IF EXISTS course_rosters CASCADE;
DROP TABLE IF EXISTS courses CASCADE ;

DROP TABLE IF EXISTS users_info CASCADE;
DROP TABLE IF EXISTS users CASCADE;


CREATE TABLE users ( -- User data provided by admin / first year experience
		id INTEGER PRIMARY KEY AUTO_INCREMENT,
		first_name TEXT NOT NULL,
		last_name TEXT NOT NULL,
		privilage VARCHAR(11) -- Teacher, Student, Admin, Peer Mentor (We could store this as an integer too)
);

CREATE TABLE user_info ( -- Data provided by users
		user_id INTEGER,
		-- username UNIQUE NOT NULL,
		email VARCHAR(255) UNIQUE NOT NULL,
		passwd VARCHAR(128) NOT NULL, -- Had the idea to use MD5 hashing, we could stick with plain text for now.
		                              -- Unless we're using some type of encryption, I could not imagine any person having a password longer than 128 characters

		FOREIGN KEY(user_id) REFERENCES users(id),

		CONSTRAINT passwdLength CHECK ( LENGTH(passwd) > 8 )
);

CREATE TABLE courses ( -- LSEM information
		id INTEGER PRIMARY KEY AUTO_INCREMENT, -- Same as crn number at Longwood
		semester INTEGER, 
		year VARCHAR(4),  
		section INTEGER NOT NULL, 
		department TEXT,  -- Examples: Math & Computer Science, Undeclared, Psychology & Sociology, etc.
		class_key VARCHAR(12), -- This is automatically generated and provided to students so they may join classes.

		CONSTRAINT CheckYear CHECK (year BETWEEN 2013 and 10000),
		CONSTRAINT CheckId CHECK (id BETWEEN 9999 and 100000)	
);

ALTER TABLE courses AUTO_INCREMENT = 50000;

CREATE TABLE course_rosters ( -- LSEM class make up
		course_id INTEGER REFERENCES courses(id),
		user_id INTEGER REFERENCES users(id)	    	
);

-- ASSIGNMENTS (Not really sure if we're far along enough to do this, but why not?)

CREATE TABLE assignments (
		id INTEGER PRIMARY KEY AUTO_INCREMENT,
		assign_type TEXT, -- We could store this multiple ways (Seperate tables, integers, code)
		description TEXT,
		name TEXT,
		owner_id INTEGER REFERENCES users(id)

		-- How are we storing assignments / activities?

);

CREATE TABLE assignment_info (
		assign_id INTEGER REFERENCES assignment(id),
		start_date TIMESTAMP,
		due_date TIMESTAMP,
		lsem_id INTEGER REFERENCES lsems(id),
		points_available INTEGER
);

CREATE TABLE assignment_submission (
		submission_id INTEGER PRIMARY KEY AUTO_INCREMENT,
		assignment_id INTEGER REFERENCES assignments(id),
		user_id INTEGER REFERENCES users(id),

		submission_time TIMESTAMP,
		points_given INTEGER

		-- What are we submitting?
);
