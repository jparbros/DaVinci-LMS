require 'spec_helper'

describe Submissions::SubmissionsPanelWidget do
  has_widgets do |root|
    root << widget('submissions/submissions_panel')
  end
  
  it "should render :display" do
    render_widget('submissions/submissions_panel', :display).should have_selector("h1")
  end
  
end
