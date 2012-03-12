class Tasks::SubmissionsWidget < Apotomo::Widget

  def display(course, task)
    @course = course
    @submissions = task.submissions
    render
  end

end
