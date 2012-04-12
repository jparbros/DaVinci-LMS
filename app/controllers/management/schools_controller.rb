class Management::SchoolsController < ApplicationController
  
  before_filter :require_owner_rights
  
  has_widgets do |root|
    root << widget('management/schools/school_panel', :school_panel)
  end
  
  def show
    @school = School.first
  end
end
