class HomeController < ApplicationController
  
  has_widgets do |root|
    root << widget("home/home_panel", :home_panel)
  end
  
  def index    
  end
end
