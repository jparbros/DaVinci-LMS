class Management::Schools::AdministratorsWidget < Apotomo::Widget

  def display
    render locals: { administrators: User.where(administrator: true) }
  end

end
