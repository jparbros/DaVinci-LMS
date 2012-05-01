class Courses::MessagesWidget < Apotomo::Widget
  
  responds_to_event :add_message
  responds_to_event :show_more
  responds_to_event :show_less

  def display(course)
    messages = course.messages.order_by([:date, :desc]).page(1).per(6)
    render view: :display, locals: {course: course, messages: messages, message: Message.new, current_user: options[:current_user], next_page: 2}
  end

  def add_message(evt)
    message = Message.new(evt[:message])
    course = Course.find(evt[:course])
    course.messages << message
    course.save
    update({:state => :display}, course)
  end
  
  def show_less(evt)
    update({:state => :display}, Course.find(evt[:course]))
  end
  
  def show_more(evt)
    course = Course.find(evt[:course])
    page = evt[:page].to_i    
    messages = course.messages.order_by([:date, :desc]).page(page).per(6)
    next_page = page
    if messages.last_page? then next_page = nil else next_page += 1 end
    update '#new_batch_of_messages', view: :messages, locals: {course: course, messages: messages, next_page: next_page}
  end

end
