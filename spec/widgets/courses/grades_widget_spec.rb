require 'spec_helper'

describe Courses::GradesWidget do
  has_widgets do |root|
    root << widget('courses/grades')
  end
  
  it "should render :display" do
    render_widget('courses/grade', :display).should have_selector("h1")
  end
  
end
