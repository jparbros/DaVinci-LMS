class Management::Schools::SchoolPanelWidget < Apotomo::Widget
  
  has_widgets do |root|
    root << widget('management/schools/edit', :edit)
    root << widget('management/schools/administrators', :administrators)
  end

  def display(school)
    render locals: {school: school, owners: User.where(owner: true)}
  end

end
