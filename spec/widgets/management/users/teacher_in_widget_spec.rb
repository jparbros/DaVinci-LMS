require 'spec_helper'

describe Management::Users::TeacherInWidget do
  has_widgets do |root|
    root << widget('management/users/teacher_in')
  end
  
  it "should render :display" do
    render_widget('management/users/teacher_in', :display).should have_selector("h1")
  end
  
end
