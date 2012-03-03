require 'spec_helper'

describe Management::NewUserWidget do
  has_widgets do |root|
    root << widget('management/new_user')
  end
  
  it "should render :display" do
    render_widget('management/new_user', :display).should have_selector("h1")
  end
  
end
