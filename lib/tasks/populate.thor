class Populate < Thor::Group
  desc "Set up a DaVinci LMS instance with fake data"

  def populate
    require './config/environment'

    DatabaseCleaner.clean

    lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    Course.create(full_name: 'Introduction to Databases', abbreviation: 'CS-145', description: lorem)
    Course.create(full_name: 'Design and Analysis of Algorithms', abbreviation: 'CS-161', description: lorem)
    Course.create(full_name: 'Introduction to Computer Vision', abbreviation: 'CS-223-B', description: lorem)
    Course.create(full_name: 'Advanced Topics in Networking', abbreviation: 'CS-244', description: lorem)
    Course.create(full_name: 'Introduction to Computer Networks', abbreviation: 'CS-244-A', description: lorem)
    Course.create(full_name: 'Parallel Computer Architecture and Programming', abbreviation: 'CS-315-A', description: lorem)
    Course.create(full_name: 'Projects in Computer Networks', abbreviation: 'CS-344', description: lorem)
    Course.create(full_name: 'Computer Graphics Geometric Modeling', abbreviation: 'CS-348-A', description: lorem)
    Course.create(full_name: 'Web Development', abbreviation: 'CS-124', description: lorem)


    owner = Fabricate(:user, email: 'owner@test.com', password: 'owner', owner: true)
    admin = Fabricate(:user, email: 'admin@test.com', password: 'admin', admin: true)
    student = Fabricate(:user, email: 'student@test.com', password: 'student')
    teacher = Fabricate(:user, email: 'teacher@test.com', password: 'teacher')

    school = Fabricate(:school)

    course = Course.first

    course.teachers << teacher
    course.teachers << admin
    course.students << student
    course.save

    Course.all.each { |c| c.students << student; c.teachers << teacher; c.teachers << admin}

    teacher.save
    student.save
    admin.save

    Course.all.each {|c| 10.times { c.students << Fabricate(:user) }; c.save }

    5.times { Fabricate(:user, admin: true) }
  end

end