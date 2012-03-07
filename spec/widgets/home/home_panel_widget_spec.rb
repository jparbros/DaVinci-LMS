require 'spec_helper'

describe Home::HomePanelWidget do
  has_widgets do |root|
    root << widget('home/home_panel')
  end
  
  it "should render :display" do
    render_widget('home/home_panel', :display).should have_selector("h1")
  end
  
end
