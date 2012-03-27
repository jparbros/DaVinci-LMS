class Management::Courses::StudentsWidget < Apotomo::Widget
  responds_to_event :set_add_mode
  responds_to_event :set_remove_mode
  responds_to_event :done
  responds_to_event :add_student
  responds_to_event :remove_student

  helper :application

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
    @message = "Removed <a href='/management/users/#{student.id}'>#{student.name}</a> from <a href='/management/courses/#{course.id}'>#{course.full_name}</a>"
    render({state: :set_remove_mode}, evt, course)
  end

  def set_add_mode(evt, course = nil)
    course ||= Course.find(evt[:course_id])
    students = course.students
    candidates = candidates(User.not_in(_id: course.student_ids))
    update view: :add_mode, locals: {course: course, students: students, candidates: candidates}
  end

  def add_student(evt)
    student = User.find(evt[:student_id])
    course = Course.find(evt[:course_id])
    course.students << student
    if course.save
      @message = "Added <a href='/management/users/#{student.id}'>#{student.name}</a> as a student in <a href='/management/courses/#{course.id}'>#{course.full_name}</a>"
      render({state: :set_add_mode}, evt, course)
    end
  end

  def done(evt)
    update({state: :display}, Course.find(evt[:course_id]))
  end

  private
    def candidates(users=[])
      if users.empty?
        return User.all.collect { |user| {'student_id' => user.id, 'value' => user.name} }
      else
        return users.collect { |user| {'student_id' => user.id, 'value' => user.name} }
      end
    end
end