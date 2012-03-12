require 'spec_helper'

describe Courses::PeopleWidget do
  has_widgets do |root|
    root << widget('courses/people')
  end
  
  it "should render :teachers" do
    render_widget('courses/person', :teachers).should have_selector("h1")
  end
  
  it "should render :students" do
    render_widget('courses/person', :students).should have_selector("h1")
  end
  
end
