class Tasks::EditTaskWidget < Apotomo::Widget
  responds_to_event :submit
  helper :application

  def display(course, task)
    @course = course
    @task = task
    render
  end

  def submit(evt)
    @course = Course.find(evt[:course])    
    @task = @course.tasks.where(_id: evt[:id]).first
    logger.info @task
    if @task.update_attributes(evt[:task])
      @message = "Changes in #{@task.title} saved"
      update view: :display
    else
      update view: :display
    end
  end

end
