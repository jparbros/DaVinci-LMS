require 'spec_helper'

describe Grades::GradeWidget do
  has_widgets do |root|
    root << widget('grades/grade')
  end
  
  it "should render :display" do
    render_widget('grades/grade', :display).should have_selector("h1")
  end
  
end
