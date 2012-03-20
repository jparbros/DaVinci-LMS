class CoursesController < ApplicationController
  
  has_widgets do |root|
    root << widget('courses/course_panel', :course_panel)
  end

  def show
    @user = current_user
    @course = Course.find(params[:id])  
  end
    
end
