require 'spec_helper'

describe Submissions::MarkWidget do
  has_widgets do |root|
    root << widget('submissions/mark')
  end
  
  it "should render :display" do
    render_widget('submissions/mark', :display).should have_selector("h1")
  end
  
end
