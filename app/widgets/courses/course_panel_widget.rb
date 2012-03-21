class Courses::CoursePanelWidget < Apotomo::Widget
  
  helper :application
  
  has_widgets do |root|
    root << widget("courses/files", :files, :current_user => options[:current_user])
  end

  def display(course, current_user)    
    render :view => :display, :locals => {course: course, current_user: current_user}
  end
  
  def tasks(course, current_user)
    if current_user.student?(course)
      submissions = course.tasks.map.each do |task|
        task.submissions.where(:user_id => current_user.id).first
      end
      render view: :tasks_student, locals: {course: course, submissions: submissions}
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
