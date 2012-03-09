require 'spec_helper'

describe Courses::NewTasksWidget do
  has_widgets do |root|
    root << widget('courses/new_tasks')
  end
  
  it "should render :display" do
    render_widget('courses/new_task', :display).should have_selector("h1")
  end
  
end
