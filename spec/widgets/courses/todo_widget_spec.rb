require 'spec_helper'

describe Courses::TodoWidget do
  has_widgets do |root|
    root << widget('courses/todo')
  end
  
  it "should render :display" do
    render_widget('courses/todo', :display).should have_selector("h1")
  end
  
end
