require 'spec_helper'

describe Management::Users::StudentInWidget do
  has_widgets do |root|
    root << widget('management/users/student_in')
  end
  
  it "should render :display" do
    render_widget('management/users/student_in', :display).should have_selector("h1")
  end
  
end
