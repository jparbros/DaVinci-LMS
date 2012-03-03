class Management::NewUserWidget < Apotomo::Widget
  responds_to_event :submit

  def display
    @user = User.new
    render
  end
  
  def submit(evt)
    @user = User.new(params[:user])
    if @user.save
      @message = 'User saved'
      @user = User.new
      update :view => :display      
    else
      update :view => :display
    end
  end

end
