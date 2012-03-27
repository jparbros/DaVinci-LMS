class Tasks::SubmissionsWidget < Apotomo::Widget

  def display(course, task)
    render locals: {course: course, submissions: task.submissions}
  end

end
