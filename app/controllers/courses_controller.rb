class CoursesController < ApplicationController
  
  has_widgets do |root|
    root << widget('courses/course_panel', :course_panel, :current_user => current_user)
  end

  def show
    @user = current_user
    @course = Course.find(params[:id])  
  end
  
  def add_file
    course = Course.find(params[:course_id])
    grid = Mongo::Grid.new(Mongoid.database)
    new_file = params[:course][:new_file]
    file = grid.put(params[:course][:new_file], :filename => new_file.original_filename, :content_type => new_file.content_type)
    course.uploads << file
    course.save
    redirect_to course_path(params[:course_id]) + "#files"
  end
    
end
