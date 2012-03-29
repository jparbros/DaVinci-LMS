# encoding: utf-8

Course.create(full_name: 'Introduction to Databases', abbreviation: 'CS-145')
Course.create(full_name: 'Design and Analysis of Algorithms', abbreviation: 'CS-161')
Course.create(full_name: 'Introduction to Computer Vision', abbreviation: 'CS-223B-')
Course.create(full_name: 'Advanced Topics in Networking', abbreviation: 'CS-244')
Course.create(full_name: 'Introduction to Computer Networks', abbreviation: 'CS-244-A')
Course.create(full_name: 'Parallel Computer Architecture and Programming', abbreviation: 'CS-315A')
Course.create(full_name: 'Projects in Computer Networks', abbreviation: 'CS-344')
Course.create(full_name: 'Computer Graphics Geometric Modeling', abbreviation: 'CS-348-A')
Course.create(full_name: 'Web Development', abbreviation: 'CS-124')

admin = Fabricate(:user, email: 'admin@test.kiwi', password: 'admin', dni: '2487342387')
student = Fabricate(:user, email: 'student@test.kiwi', password: 'student', dni: '3487342387')
teacher = Fabricate(:user, email: 'teacher@test.kiwi', password: 'teacher', dni: '3587342387')

course = Course.first

course.teachers << teacher
course.teachers << admin
course.students << student
course.save

Course.all.each {|c| 10.times { c.students << Fabricate(:user) }; c.save }