require 'spec_helper'

describe Management::Users::IndexPanelWidget do
  has_widgets do |root|
    root << widget('management/users/index_panel')
  end
  
  it "should render :display" do
    render_widget('management/users/index_panel', :display).should have_selector("h1")
  end
  
end
