class SubmissionsController < ApplicationController
  
  def show
    @course = Course.find(params[:course_id])
    @submission = Submission.find(params[:id])
    @task = @submission.task
    @user = current_user
  end
  
end
