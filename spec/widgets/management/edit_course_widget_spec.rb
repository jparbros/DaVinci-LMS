require 'spec_helper'

describe Management::EditCourseWidget do
  has_widgets do |root|
    root << widget('management/edit_course')
  end
  
  it "should render :display" do
    render_widget('management/edit_course', :display).should have_selector("h1")
  end
  
end
