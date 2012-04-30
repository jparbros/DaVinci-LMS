require 'spec_helper'

describe Courses::MessagesWidget do
  has_widgets do |root|
    root << widget('courses/messages')
  end
  
  it "should render :display" do
    render_widget('courses/message', :display).should have_selector("h1")
  end
  
end
