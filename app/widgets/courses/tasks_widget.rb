class Courses::TasksWidget < Apotomo::Widget

  def display_teacher(course)
    @course = course
    @tasks = @course.tasks
    render 
  end
  
  def display_student(course, user)
    @course = course
    @submissions = course.tasks.map.each do |task|
      task.submissions.where(:user_id => user.id).first
    end
    render 
  end

end
