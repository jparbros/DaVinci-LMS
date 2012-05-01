class Courses::CoursePanelWidget < Apotomo::Widget
  
  helper :application  
  
  has_widgets do |root|
    root << widget("courses/files", :files, current_user: options[:current_user])
    root << widget("courses/messages", :messages, current_user: options[:current_user])
    root << widget("courses/todo_list", :todo_list, current_user: options[:current_user])
    root << widget("courses/grades", :grades)
  end

  def display(course, current_user)    
    render view: :display, locals: {course: course, current_user: current_user}
  end
    
  def teachers(course)
    render view: :teachers, locals: {teachers: course.teachers}
  end

  def students(course)
    render view: :students, locals: {students: course.students}
  end
  
end
