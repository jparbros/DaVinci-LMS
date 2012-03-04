class Management::CoursesController < ApplicationController

  has_widgets do |root|
    root << widget('management/new_course', :new_course)
    root << widget('management/course_panel', :course_panel)
  end

  def index
    @courses = Course.all
  end

  def new

  end

end
