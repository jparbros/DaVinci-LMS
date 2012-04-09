class Management::SchoolsController < ApplicationController
  
  has_widgets do |root|
    root << widget('management/schools/school_panel', :school_panel)
  end
  
  def show
    @school = School.first
  end
end
