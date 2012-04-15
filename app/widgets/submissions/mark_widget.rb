class Submissions::MarkWidget < Apotomo::Widget
  responds_to_event :mark
  
  helper :application
  include ApplicationHelper

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
    alert_message(:success, "Mark saved! #{view_context.link_to 'Go back to the submission list', course_task_path(submission.task.course.id, submission.task.id)+'#submissions'}")
    update({state: :display}, user, submission.task.course, submission)
  end

end
