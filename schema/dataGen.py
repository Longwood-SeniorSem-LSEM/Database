with open('users.csv') as f:
	id = 1
	for line in f:
		name=line.split('|')
		print "INSERT INTO users (email, account_type) VALUES ('%s.%s@live.longwood.edu', 'student');" % (name[0], name[1])
   		print "INSERT INTO user_credentials (user_id, passwd) VALUES (%d, '%s%spass');" % (id,name[0],name[1]) 
		print "INSERT INTO user_info (user_id, first_name, last_name) VALUES (%d,'%s','%s');" % (id,name[0],name[1])	
		id += 1

with open('courses.csv') as f:
	id = 50000
	for line in f:
		items = f.split(line)
		print "INSERT INTO (subject, course, section, title) VALUES ('%s',%d,%d,'%s');" % (items[0],items[1],items[2],items[3])
		id += 1
