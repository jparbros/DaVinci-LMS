class Management::CoursesController < ApplicationController
  
  has_widgets do |root|
    root << widget('management/new_course', :new_course)    
  end

  def index
    
  end
  
  def new
    
  end

end
