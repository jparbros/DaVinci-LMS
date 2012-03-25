class Management::Users::UserPanelWidget < Apotomo::Widget
  
  has_widgets do |root|
    root << widget('management/users/edit_user', :edit_user)
    root << widget('management/users/student_in', :student_in)
  end

  def display(user)
    render locals: {user: user}
  end

end
