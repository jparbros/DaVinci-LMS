require 'spec_helper'

describe Courses::CoursePanelWidget do
  has_widgets do |root|
    root << widget('courses/course_panel')
  end
  
  it "should render :display" do
    render_widget('courses/course_panel', :display).should have_selector("h1")
  end
  
end
