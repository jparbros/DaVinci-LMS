class Management::Users::TeacherInWidget < Apotomo::Widget

  def display(user)
    render locals: {user: user}
  end

end
