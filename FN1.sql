DROP TABLE IF EXISTS course_rosters;
DROP TABLE IF EXISTS courses;

DROP TABLE IF EXISTS user_info CASCADE;
DROP TABLE IF EXISTS users CASCADE;


-- User Tables --

CREATE TABLE users ( 		
	id               INTEGER        PRIMARY KEY AUTO_INCREMENT,
	first_name       TEXT           NOT NULL,
	last_name        TEXT           NOT NULL,
	privilage        VARCHAR(11) 
);

CREATE TABLE user_info (
	user_id          INTEGER        REFERENCES users(id),
	email            VARCHAR(255)   UNIQUE NOT NULL,
	passwd           VARCHAR(255)   NOT NULL,
	CONSTRAINT passwdLength CHECK ( LENGTH(passwd) > 8 )	
);

-- Course Tables --

CREATE TABLE courses (
	id               INTEGER        PRIMARY KEY AUTO_INCREMENT,
	semester         INTEGER,
	year             VARCHAR(4),
	department       VARCHAR(5),
	description      TEXT,
	class_key        VARCHAR(12),

	CONSTRAINT check_year CHECK (year BETWEEN 2013 AND 10000),
	CONSTRAINT check_id   CHECK (id BETWEEN 9999 AND 100000)
);

ALTER TABLE courses AUTO_INCREMENT = 50000;

CREATE TABLE course_rosters (
	course_id        INTEGER        REFERENCES courses(id),
	user_id          INTEGER        REFERENCES users(id)
);
