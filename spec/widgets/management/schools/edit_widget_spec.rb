require 'spec_helper'

describe Management::Schools::EditWidget do
  has_widgets do |root|
    root << widget('management/schools/edit')
  end
  
  it "should render :display" do
    render_widget('management/schools/edit', :display).should have_selector("h1")
  end
  
end
