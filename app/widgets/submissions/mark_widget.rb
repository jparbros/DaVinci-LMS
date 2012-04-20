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
    if evt[:submission][:mark].present?
      submission.mark = evt[:submission][:mark]
      submission.save
      list_link = view_context.link_to(t(:go_back_to_submission_list), course_task_path(submission.task.course.id, submission.task.id)+'#submissions')
      alert_message(:success, t(:mark_saved, list_link: list_link))
    else
      alert_message(:error, t(:mark_empty, list_link: list_link))
    end
    update({state: :display}, user, submission.task.course, submission)
  end

end
