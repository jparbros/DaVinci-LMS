class Courses::CoursePanelWidget < Apotomo::Widget
  
  helper :application

  def display(course, current_user)    
    render :view => :display, :locals => {course: course, current_user: current_user}
  end
  
  def tasks(course, current_user)
    if current_user.student?(course)
      render view: :tasks_student, locals: {course: course, current_user: current_user}
    else
      render view: :tasks_teacher, locals: {course: course, tasks: course.tasks}
    end
  end
  
  def teachers(course)
    render view: :teachers, locals: {teachers: course.teachers}
  end

  def students(course)
    render view: :students, locals: {students: course.students}
  end

end
