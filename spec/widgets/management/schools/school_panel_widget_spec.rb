require 'spec_helper'

describe Management::Schools::SchoolPanelWidget do
  has_widgets do |root|
    root << widget('management/schools/school_panel')
  end
  
  it "should render :display" do
    render_widget('management/schools/school_panel', :display).should have_selector("h1")
  end
  
end
