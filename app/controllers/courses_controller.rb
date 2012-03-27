class CoursesController < ApplicationController
  
  has_widgets do |root|
    root << widget('courses/course_panel', :course_panel, current_user: current_user)
  end

  def show
    @user = current_user
    @course = Course.find(params[:id])  
  end
  
  def add_file
    course = Course.find(params[:course_id])
    file = params[:course][:new_file]
    AddUploadContext.call(course, file)    
    redirect_to course_path(params[:course_id]) + "#files"
  end
    
end
