class Management::CoursesController < ApplicationController
  
  before_filter :require_admin_rights

  has_widgets do |root|
    root << widget('management/courses/new_course', :new_course)
    root << widget('management/courses/course_panel', :course_panel)
    root << widget('management/courses/index_panel', :index_panel)
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
