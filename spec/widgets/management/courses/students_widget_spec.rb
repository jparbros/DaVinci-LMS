require 'spec_helper'

describe Management::Courses::StudentsWidget do
  has_widgets do |root|
    root << widget('management/courses/students')
  end
  
  it "should render :display" do
    render_widget('management/courses/student', :display).should have_selector("h1")
  end
  
end
