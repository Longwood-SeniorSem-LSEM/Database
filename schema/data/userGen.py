with open('users.csv') as f:
	id = 1
	for line in f:
		name=line.split('|')
		print "INSERT INTO users (email, account_type, passwd, first_name, last_name)\
		   	VALUES ('%s.%s@live.longwood.edu', 'student', '%s%spass', '%s', '%s');" % (name[0], name[1],name[0],name[1],name[0],name[1])
		id += 1


