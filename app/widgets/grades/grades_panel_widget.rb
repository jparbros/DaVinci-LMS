class Grades::GradesPanelWidget < Apotomo::Widget
  
  helper :application

  def display(course)
    render locals: {course: course}
  end
  
  def grade(course, user)
    render view: :grade, locals: {user: user}
  end

end
