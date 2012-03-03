require 'spec_helper'

describe Management::NewCourseWidget do
  has_widgets do |root|
    root << widget('management/new_course')
  end
  
  it "should render :display" do
    render_widget('management/new_course', :display).should have_selector("h1")
  end
  
end
