class Management::Schools::AdministratorsWidget < Apotomo::Widget

  responds_to_event :activate_add_mode
  responds_to_event :add
  responds_to_event :activate_remove_mode
  responds_to_event :remove
  responds_to_event :done

  helper :application
  include ApplicationHelper

  def display
    render locals: { administrators: User.where(admin: true) }
  end

  def activate_add_mode(evt)
    update :view => 'add_mode',
      locals: {
        administrators: User.where(admin: true),
        candidates:  candidates(User.where(admin: false))}
  end

  def add(evt)
    user = User.find(evt[:user_id])
    user.admin = true
    user.save
    alert_message(:success, "<a href='/management/users/#{user.id}'>#{user.name}</a> is now an administrator")
    render({:state => :activate_add_mode}, evt)
  end
  
  def activate_remove_mode(evt)
    update :view => 'remove_mode',
      locals: {
        administrators: User.where(admin: true),
        candidates:  candidates(User.where(admin: true))}
  end
  
  def remove(evt)
    user = User.find(evt[:user_id])
    user.admin = false
    user.save
    alert_message(:success, "<a href='/management/users/#{user.id}'>#{user.name}</a> is no longer an administrator")
    render({:state => :activate_remove_mode}, evt)
  end

  def done(evt)
    replace :state => :display
  end

  private
    def candidates(users = [])
      users.map.each { |user| {'user_id' => user.id, 'value' => user.name} }
    end

end
