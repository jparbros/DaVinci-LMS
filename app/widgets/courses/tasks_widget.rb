class Courses::TasksWidget < Apotomo::Widget

  def display(course)
    @course = course
    @tasks = @course.tasks
    render
  end

end
