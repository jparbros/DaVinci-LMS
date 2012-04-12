class Tasks::NewTaskWidget < Apotomo::Widget  
  responds_to_event :submit
  
  helper :application
  include ApplicationHelper  

  def display(course)
    render locals: {course: course, task: Task.new}
  end

  def submit(evt)
    course = Course.find(evt[:course_id])
    task = Task.new(evt[:task])
    course.tasks << task
    if course.save
      create_task(task, course)
      alert_message(:success, "Assignment #{view_context.link_to(task.title, course_task_path(course.id, task.id))} created")
      
      update view: :display, locals: {course: course, task: Task.new}
    else
      update view: :display, locals: {course: course, task: task}
    end
  end

  private
    def create_task(task, course)
      course.tasks << task
      course.students.each do |student|
        submission = Submission.new
        task.submissions << submission
        student.submissions << submission
        task.save
        student.save
      end
      course.save
    end

end
