class Management::Courses::StudentsWidget < Apotomo::Widget
  responds_to_event :set_add_mode
  responds_to_event :set_remove_mode
  responds_to_event :done
  responds_to_event :add_student
  responds_to_event :remove_student

  responds_to_event :set_add_mode, passing: :course_panel, from: :teachers, with: :done
  responds_to_event :set_remove_mode, passing: :course_panel, from: :teachers, with: :done

  helper :application
  include ApplicationHelper

  def display(course)
    render locals: {course: course}
  end

  def set_remove_mode(evt, course = nil)
    course ||= Course.find(evt[:course_id])
    students = course.students
    candidates = candidates(students)
    update view: :remove_mode, locals: {course: course, students: students, candidates: candidates}
  end

  def remove_student(evt)
    student = User.find(evt[:student_id])
    course = Course.find(evt[:course_id])
    course.students.delete(student)
    alert_message(:success, "Removed <a href='/management/users/#{student.id}'>#{student.name}</a> from the course")
    render({state: :set_remove_mode}, evt, course)
  end

  def set_add_mode(evt, course = nil)
    course ||= Course.find(evt[:course_id])
    students = course.students
    teachers = course.teachers
    users = candidates(User.where(:_id.nin => (students.map(&:id) + teachers.map(&:id))))
    update view: :add_mode, locals: {course: course, students: students, candidates: users}
  end

  def add_student(evt)
    student = User.find(evt[:student_id])
    course = Course.find(evt[:course_id])
    course.students << student
    if course.save
      alert_message(:success, "Added <a href='/management/users/#{student.id}'>#{student.name}</a> as a student")
    end
    render({state: :set_add_mode}, evt, course)
  end

  def done(evt)
    update({state: :display}, Course.find(evt[:course_id]))
  end

  private
    def candidates(users = [])
      users.map.each { |user| {'student_id' => user.id, 'value' => user.name} }
    end
end