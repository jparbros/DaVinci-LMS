require 'spec_helper'

describe Management::Courses::IndexPanelWidget do
  has_widgets do |root|
    root << widget('management/courses/index_panel')
  end
  
  it "should render :display" do
    render_widget('management/courses/index_panel', :display).should have_selector("h1")
  end
  
end
