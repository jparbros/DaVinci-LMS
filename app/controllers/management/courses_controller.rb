class Management::CoursesController < ApplicationController

  has_widgets do |root|
    root << widget('management/courses/new_course', :new_course)
    root << widget('management/courses/course_panel', :course_panel)
  end

  def index
    @courses = Course.all
  end

  def new

  end
  
  def show
    @course = Course.find(params[:id])
  end

end
