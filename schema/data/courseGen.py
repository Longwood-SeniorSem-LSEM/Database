with open('users.csv') as f:
	id = 1
	for line in f:
		name=line.split('|')
		print "INSERT INTO users (email, account_type) VALUES ('%s.%s@live.longwood.edu', 'student');" % (name[0], name[1])
   		print "INSERT INTO user_credentials (user_id, passwd) VALUES (%d, '%s%spass');" % (id,name[0],name[1]) 
		print "INSERT INTO user_info (user_id, first_name, last_name) VALUES (%d,'%s','%s');" % (id,name[0],name[1])	
		id += 1


