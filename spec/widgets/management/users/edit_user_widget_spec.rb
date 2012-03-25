require 'spec_helper'

describe Management::Users::EditUserWidget do
  has_widgets do |root|
    root << widget('management/users/edit_user')
  end
  
  it "should render :display" do
    render_widget('management/users/edit_user', :display).should have_selector("h1")
  end
  
end
