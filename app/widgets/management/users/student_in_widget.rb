class Management::Users::StudentInWidget < Apotomo::Widget

  def display(user)
    render locals: {user: user}
  end

end
