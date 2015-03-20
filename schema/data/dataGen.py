with open('users.csv') as f:
	id = 1
	for line in f:
		name=line.split('|')
		print "INSERT INTO users (email, account_type, passwd, first_name, last_name)\
		   	VALUES ('%s.%s@live.longwood.edu', 'student', '%s%spass', '%s', '%s');" % (name[0], name[1],name[0],name[1],name[0],name[1])
		id += 1

with open('courses.csv') as f:
	id = 50000
	for line in f:
		items = line.split('|')
		print "INSERT INTO classes (subject, course, section, title) VALUES ('%s',%s,%s,'%s');" % (items[0],items[1],items[2],items[3])
		id += 1
