class TasksController < ApplicationController
  
  has_widgets do |root|
    root << widget("courses/new_task", :new_task)
  end
  
  def new
    @course = Course.find(params[:course_id])
  end
  
end
