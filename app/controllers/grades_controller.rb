class GradesController < ApplicationController
  
  has_widgets do |root|
    root << widget('grades/grades_panel', :grades_panel)
  end
  
  def index
    @course = Course.find(params[:course_id])
  end
  
end
