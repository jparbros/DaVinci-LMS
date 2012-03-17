class Submissions::SubmissionWidget < Apotomo::Widget

  responds_to_event :submit_submission

  def display(submission)
    user = options[:user]
    course = submission.task.course
    if user.teacher?(course)
      render :view => :display_teacher, :locals => {:submission => submission}
    else
      render :view => :display, :locals => {:submission => submission, :course => course}
    end
  end

  def submit_submission(evt)
    user = options[:user]
    submission = user.submissions.find(evt[:submission_id])
    submission.comment = evt[:submission][:comment]
    submission.save
    @message = 'Change saved!'
    update({:state => :display}, submission)
  end
end
