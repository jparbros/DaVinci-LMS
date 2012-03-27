class Management::Courses::TeachersWidget < Apotomo::Widget
  responds_to_event :set_add_mode
  responds_to_event :set_remove_mode
  responds_to_event :done
  responds_to_event :add_teacher
  responds_to_event :remove_teacher
  
  helper :application

  def display(course)
    render locals: {course: course, teachers: course.teachers}
  end
  
  def set_remove_mode(evt, course=nil)
    course ||= Course.find(evt[:course_id])
    teachers = course.teachers
    candidates = candidates(teachers)
    update view: :remove_mode, locals: {course: course, teachers: teachers, candidates: candidates}
  end

  def remove_teacher(evt)
    teacher = User.find(evt[:teacher_id])
    course = Course.find(evt[:course_id])
    course.teachers.delete(teacher)
    @message = "Removed <a href='/management/users/#{teacher.id}'>#{teacher.name}</a> from <a href='/management/courses/#{course.id}'>#{course.full_name}</a>"
    render({state: :set_remove_mode}, evt, course)
  end
  
  def set_add_mode(evt, course=nil)
    course ||= Course.find(evt[:course_id])
    teachers = course.teachers
    candidates = candidates(User.not_in(_id: teachers.map(&:id)))
    update view: :add_mode, locals: {course: course, teachers: teachers, candidates: candidates}
  end

  def add_teacher(evt)
    teacher = User.find(evt[:teacher_id])
    course = Course.find(evt[:course_id])
    course.teachers << teacher
    if course.save
      @message = "Added <a href='/management/users/#{teacher.id}'>#{teacher.name}</a> as a teacher in <a href='/management/courses/#{course.id}'>#{course.full_name}</a> "
      render({state: :set_add_mode}, evt, course)
    else
      @message = "Something didn't work as expected. Reload the page and try again."
      render({state: :set_add_mode}, evt, course)
    end
  end

  def done(evt)
    update({state: :display}, Course.find(evt[:course_id]))
  end
  
  def teacher(teacher)
    render view: :teacher, locals: { teacher: teacher}
  end

  def candidates(users=[])
    if users.empty?
      return User.all.collect { |user| {'teacher_id' => user.id, 'value' => user.name} }
    else
      return users.collect { |user| {'teacher_id' => user.id, 'value' => user.name} }
    end
  end

end
