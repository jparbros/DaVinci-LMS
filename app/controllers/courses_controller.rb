class CoursesController < ApplicationController
  
  has_widgets do |root|
    root << widget('courses/tasks', :tasks)
    root << widget('courses/people', :people)
  end

  def show
    @user = current_user
    @course = Course.find(params[:id])  
  end
    
end
