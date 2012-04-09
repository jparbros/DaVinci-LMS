class Management::Schools::EditWidget < Apotomo::Widget
  
  helper :application

  def display(school)
    render locals: {school: school}
  end

end
