class SubmissionsController < ApplicationController
  
  has_widgets do |root|
    root << widget('submissions/submission_panel', :submission_panel, :user => current_user)
  end
  
  def show
    @course = Course.find(params[:course_id])
    @submission = Submission.find(params[:id])    
    @user = current_user
  end
  
end
