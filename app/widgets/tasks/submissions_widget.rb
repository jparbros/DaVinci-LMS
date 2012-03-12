class Tasks::SubmissionsWidget < Apotomo::Widget

  def display(course)
    @students = course.students
    render
  end

end
