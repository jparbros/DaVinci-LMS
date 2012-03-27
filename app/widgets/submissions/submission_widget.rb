class Submissions::SubmissionWidget < Apotomo::Widget
  responds_to_event :submit_submission
  responds_to_event :remove

  helper :application

  def display(submission)
    user = options[:user]
    course = submission.task.course
    course.extend GridfsFileRepository
    files = course.uploaded_files
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
    submission.save
    @message = 'Change saved!'
    update({state: :display}, submission)
  end

  def remove(evt)
    user = options[:user]
    submission = user.submissions.find(evt[:submission_id])
    file = submission.uploads.find(evt[:file_id])
    if file
      delete_file(submission, BSON::ObjectId(evt[:file_id]))
      submission.save
      update({state: :display}, submission)
    else
      render text: ''
    end
  end

  private

    def delete_file(submission, file)
      grid = Mongo::Grid.new(Mongoid.database)
      grid.delete(file)
      submission.uploads.delete(file)
    end

end
