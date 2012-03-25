require 'spec_helper'

describe Management::Users::UserPanelWidget do
  has_widgets do |root|
    root << widget('management/users/user_panel')
  end
  
  it "should render :display" do
    render_widget('management/users/user_panel', :display).should have_selector("h1")
  end
  
end
