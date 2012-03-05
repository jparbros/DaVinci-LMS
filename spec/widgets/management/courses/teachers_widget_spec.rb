require 'spec_helper'

describe Management::Courses::TeachersWidget do
  has_widgets do |root|
    root << widget('management/courses/teachers')
  end
  
  it "should render :display" do
    render_widget('management/teacher', :display).should have_selector("h1")
  end
  
end
