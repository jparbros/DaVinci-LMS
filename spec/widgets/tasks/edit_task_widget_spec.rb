require 'spec_helper'

describe Tasks::EditTaskWidget do
  has_widgets do |root|
    root << widget('tasks/edit_task')
  end
  
  it "should render :display" do
    render_widget('tasks/edit_task', :display).should have_selector("h1")
  end
  
end
