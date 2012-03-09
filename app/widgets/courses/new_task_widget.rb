class Courses::NewTaskWidget < Apotomo::Widget
  helper :application
  
  responds_to_event :submit

  def display(course)
    @course = course
    @task = Task.new
    render
  end
  
  def submit(evt)
    @task = Task.new(evt[:task])
    @course = Course.find(evt[:course])
    @course.tasks << @task
    if @course.save
      @message = "Task #{@task.title} saved"
      @task = Task.new
      redirect_to course_path(@course.id)      
    else
      update :view => :display
    end
  end

end
