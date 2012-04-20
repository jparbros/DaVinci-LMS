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
      task_link = view_context.link_to task.title, course_task_path(course.id, task.id)
      alert_message(:success, t(:task_changed, task: task_link))
      update view: :display, locals: {course: course, task: task}
    else
      update view: :display, locals: {course: course, task: task}
    end
  end

end
