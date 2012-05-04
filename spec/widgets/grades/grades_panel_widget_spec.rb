require 'spec_helper'

describe Grades::GradesPanelWidget do
  has_widgets do |root|
    root << widget('grades/grades_panel')
  end
  
  it "should render :display" do
    render_widget('grades/grades_panel', :display).should have_selector("h1")
  end
  
end
