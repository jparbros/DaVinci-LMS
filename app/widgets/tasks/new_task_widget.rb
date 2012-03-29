class Tasks::NewTaskWidget < Apotomo::Widget
  helper :application

  responds_to_event :submit

  def display(course)
    render locals: {course: course, task: Task.new}
  end

  def submit(evt)
    course = Course.find(evt[:course_id])
    task = Task.new(evt[:task])
    course.tasks << task
    if course.save
      create_task(task, course)
      @message = "Task <a href='/courses/#{course.id}/tasks/#{task.id}'>#{task.title}</a> created"
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
