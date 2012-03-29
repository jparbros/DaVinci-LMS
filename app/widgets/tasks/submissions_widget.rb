class Tasks::SubmissionsWidget < Apotomo::Widget

  def display(course, task)
    graded_submissions = task.submissions.where(:mark.ne => nil).sort_by {|s| s.user.name}
    ungraded_submissions = task.submissions.where(:mark => nil).sort_by {|s| s.user.name}
    render locals: {course: course, graded_submissions: graded_submissions, ungraded_submissions: ungraded_submissions}
  end

end
