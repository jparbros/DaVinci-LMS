class Submissions::SubmissionWidget < Apotomo::Widget
  responds_to_event :submit_submission
  responds_to_event :remove

  helper :application
  include ApplicationHelper

  def display(submission)
    user = options[:user]
    course = submission.task.course
    submission.extend GridfsFileRepository
    files = submission.uploaded_files
    if user.teacher?(course)
      render view: :display_teacher, locals: {submission: submission, files: files}
    else
      render view: :display_student, locals: {submission: submission, course: course, files: files}
    end
  end

  def submit_submission(evt)
    user = options[:user]
    submission = user.submissions.find(evt[:submission_id])
    submission.comment = evt[:submission][:comment]
    if submission.active?
      submission.save
      alert_message(:success, t(:change_saved))
    end
    update({state: :display}, submission)
  end

  def remove(evt)
    user = options[:user]
    submission = user.submissions.find(evt[:submission_id])
    RemoveUploadContext.call(submission, BSON::ObjectId(evt[:file_id]))
    update({state: :display}, submission)
  end
  
end
