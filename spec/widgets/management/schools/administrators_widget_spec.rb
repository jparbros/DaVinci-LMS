require 'spec_helper'

describe Management::Schools::AdministratorsWidget do
  has_widgets do |root|
    root << widget('management/schools/administrators')
  end
  
  it "should render :display" do
    render_widget('management/schools/administrator', :display).should have_selector("h1")
  end
  
end
