require 'spec_helper'

describe Courses::FilesWidget do
  has_widgets do |root|
    root << widget('courses/files')
  end
  
  it "should render :display" do
    render_widget('courses/file', :display).should have_selector("h1")
  end
  
end
