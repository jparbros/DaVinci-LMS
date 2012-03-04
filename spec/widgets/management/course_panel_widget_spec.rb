require 'spec_helper'

describe Management::CoursePanelWidget do
  has_widgets do |root|
    root << widget('management/course_panel')
  end
  
  it "should render :display" do
    render_widget('management/course_panel', :display).should have_selector("h1")
  end
  
end
