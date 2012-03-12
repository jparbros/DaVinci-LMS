require 'spec_helper'

describe Tasks::SubmissionsWidget do
  has_widgets do |root|
    root << widget('tasks/submissions')
  end
  
  it "should render :display" do
    render_widget('tasks/submission', :display).should have_selector("h1")
  end
  
end
