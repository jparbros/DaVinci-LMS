class Courses::TasksWidget < Apotomo::Widget

  def display_teacher(course)
    @course = course
    @tasks = @course.tasks
    render 
  end
  
  def display_student(course)
    @course = course
    @tasks = @course.tasks
    render 
  end

end
