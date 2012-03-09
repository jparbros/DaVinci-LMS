require 'spec_helper'

describe Courses::TasksWidget do
  has_widgets do |root|
    root << widget('courses/tasks')
  end
  
  it "should render :display" do
    render_widget('courses/task', :display).should have_selector("h1")
  end
  
end
