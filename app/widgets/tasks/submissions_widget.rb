class Tasks::SubmissionsWidget < Apotomo::Widget

  def display(course, task)
    submissions = task.submissions.sort_by { |submission| submission.user.name }
    render locals: {course: course, submissions: submissions}
  end

end
