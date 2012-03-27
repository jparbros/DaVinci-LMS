class Submissions::MarkWidget < Apotomo::Widget
  
  responds_to_event :mark
  helper :application

  def display(user, course, submission)
    if user.student?(course)
      render view: :mark_student, locals: {submission: submission}
    else
      render view: :mark_teacher, locals: {submission: submission}
    end
  end
  
  def mark(evt)
    user = options[:user]
    submission = Submission.find(evt[:submission_id])
    submission.mark = evt[:submission][:mark]
    submission.save
    @message = "Mark saved!"
    update({state: :display}, user, submission.task.course, submission)
  end

end
