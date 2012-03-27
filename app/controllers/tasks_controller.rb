class TasksController < ApplicationController
  
  has_widgets do |root|
    root << widget("tasks/new_task", :new_task)
    root << widget("tasks/edit_task", :edit_task)
    root << widget("tasks/submissions", :submissions)
  end
  
  def new
    @course = Course.find(params[:course_id])
  end
  
  def show    
    @course = Course.find(params[:course_id])
    @task = Task.find(params[:id])
  end
  
end
