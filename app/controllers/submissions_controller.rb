class SubmissionsController < ApplicationController

  has_widgets do |root|
    root << widget('submissions/submission_panel', :submission_panel, user: current_user)
  end

  def show
    @course = Course.find(params[:course_id])
    @submission = Submission.find(params[:id])
    @user = current_user
  end

  def add_file
    submission = Submission.find(params[:submission_id])
    file = params[:submission][:new_file]
    AddUploadContext.call(submission, file)
    submission.save
    redirect_to course_submission_path(params[:course_id], submission.id) + "#attachments"
  end

end
