class Tasks::EditTaskWidget < Apotomo::Widget
  responds_to_event :submit
  
  helper :application
  include ApplicationHelper

  def display(course, task)    
    render locals: {course: course, task: task}
  end

  def submit(evt)
    course = Course.find(evt[:course])    
    task = course.tasks.find(evt[:id])
    if task.update_attributes(evt[:task])
      alert_message(:success, "Changes in #{task.title} saved")
      update view: :display, locals: {course: course, task: task}
    else
      update view: :display, locals: {course: course, task: task}
    end
  end

end
