class Management::Schools::AdministratorsWidget < Apotomo::Widget
  
  responds_to_event :activate_add_mode
  responds_to_event :add
  responds_to_event :activate_remove_mode
  responds_to_event :done
  
  helper :application
  include ApplicationHelper

  def display
    render locals: { administrators: User.where(administrator: true) }
  end
  
  def activate_add_mode(evt)
    update :view => 'add_mode', 
      locals: { 
        administrators: User.where(administrator: true), 
        candidates:  candidates(User.where(administrator: false))}
  end
  
  def add(evt)
    
  end  
  
  def done(evt)
    replace :state => :display
  end  
  
  private
    def candidates(users = [])
      users.map.each { |user| {'user_id' => user.id, 'value' => user.name} }
    end

end
