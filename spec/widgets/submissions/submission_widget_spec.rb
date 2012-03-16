require 'spec_helper'

describe Submissions::SubmissionWidget do
  has_widgets do |root|
    root << widget('submissions/submission')
  end
  
  it "should render :display" do
    render_widget('submissions/submission', :display).should have_selector("h1")
  end
  
end
