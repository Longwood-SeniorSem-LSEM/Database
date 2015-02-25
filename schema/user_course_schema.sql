DROP TABLE IF EXISTS rosters;
DROP TABLE IF EXISTS classes;

--DROP TABLE IF EXISTS user_info CASCADE;
DROP TABLE IF EXISTS users CASCADE;


-- User Tables --

CREATE TABLE users ( 		
	id               INTEGER        PRIMARY KEY AUTO_INCREMENT,

	first_name       TEXT           NOT NULL,
	last_name        TEXT           NOT NULL,

	account_type     VARCHAR(11),

	email            VARCHAR(255)   UNIQUE NOT NULL,
	passwd           VARCHAR(40)    NOT NULL,

	CONSTRAINT passwdLength CHECK ( LENGTH(passwd) > 8 ),	
	CONSTRAINT idMaxSize    CHECK (id < 100000000)
);

--CREATE TABLE user_info (
--	user_id          INTEGER        REFERENCES users(id),
--	email            VARCHAR(255)   UNIQUE NOT NULL,
--	passwd           VARCHAR(255)   NOT NULL,
--	CONSTRAINT passwdLength CHECK ( LENGTH(passwd) > 8 )	
--);

-- Class Tables --

CREATE TABLE classes (
	id               INTEGER        PRIMARY KEY AUTO_INCREMENT, 

	semester         VARCHAR(6)     NOT NULL,
	year             INTEGER        NOT NULL,

	subject          VARCHAR(5)     NOT NULL,
	course           INTEGER        NOT NULL,
	section          INTEGER        NOT NULL,

	title            TEXT           NOT NULL,

	instructor       INTEGER        REFERENCES users(id),
	class_key        VARCHAR(12)    UNIQUE NOT NULL,

	CONSTRAINT check_year    CHECK (year BETWEEN 2013 AND 10000),
	CONSTRAINT check_id      CHECK (id BETWEEN 9999 AND 100000),
	CONSTRAINT check_section CHECK (section > 0),
	CONSTRAINT check_cn      CHECK (course_number BETWEEN 0 AND 999)
);

ALTER TABLE classes AUTO_INCREMENT = 50000;

CREATE TABLE rosters (
	class_id         INTEGER        REFERENCES classes(id),
	user_id          INTEGER        REFERENCES users(id)
);
