class Submissions::SubmissionWidget < Apotomo::Widget
  
  responds_to_event :submit_submission

  def display(submission)
    user = options[:user]
    if user.teacher?(submission.task.course)
      render :view => :display_teacher, :locals => {:submission => submission}
    else
      render :view => :display, :locals => {:submission => submission}
    end
  end
  
  def submit_submission(evt)
    user = options[:user]
    submission = user.submissions.find(evt[:submission_id])
    submission.comment = evt[:submission][:comment]
    submission.save
    @message = 'Submission saved!'
    update({:state => :display}, submission)
  end

end
