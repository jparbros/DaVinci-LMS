class Management::Courses::TeachersWidget < Apotomo::Widget
  responds_to_event :set_add_mode
  responds_to_event :set_remove_mode
  responds_to_event :done
  responds_to_event :add_teacher
  responds_to_event :remove_teacher
  
  responds_to_event :set_add_mode, passing: :course_panel, from: :students, with: :done
  responds_to_event :set_remove_mode, passing: :course_panel, from: :students, with: :done
  
  helper :application
  include ApplicationHelper

  def display(course)
    render locals: {course: course, teachers: course.teachers}
  end
  
  def set_remove_mode(evt, course = nil)
    course ||= Course.find(evt[:course_id])
    teachers = course.teachers
    candidates = candidates(teachers)
    update view: :remove_mode, locals: {course: course, teachers: teachers, candidates: candidates}
  end

  def remove_teacher(evt)
    teacher = User.find(evt[:teacher_id])
    course = Course.find(evt[:course_id])
    course.teachers.delete(teacher)
    alert_message(:success, "Removed #{view_context.link_to teacher.name, management_user_path(teacher.id)} from the course")
    render({state: :set_remove_mode}, evt, course)
  end
  
  def set_add_mode(evt, course = nil)
    course ||= Course.find(evt[:course_id])
    teachers = course.teachers
    students = course.students
    users = candidates(User.where(:_id.nin => (students.map(&:id) + teachers.map(&:id))))
    update view: :add_mode, locals: {course: course, teachers: teachers, candidates: users}
  end

  def add_teacher(evt)
    teacher = User.find(evt[:teacher_id])
    course = Course.find(evt[:course_id])
    course.teachers << teacher
    if course.save
      alert_message(:success, "Added #{view_context.link_to teacher.name, management_user_path(teacher.id)} as a teacher")
      render({state: :set_add_mode}, evt, course)
    else
      alert_message(:error, "Something didn't work as expected. Reload the page and try again.")
      render({state: :set_add_mode}, evt, course)
    end
  end

  def done(evt)
    replace({state: :display}, Course.find(evt[:course_id]))
  end
  
  def teacher(teacher)
    render view: :teacher, locals: { teacher: teacher}
  end

  private
    def candidates(users = [])
      users.map.each { |user| {'teacher_id' => user.id, 'value' => user.name} }      
    end

end
