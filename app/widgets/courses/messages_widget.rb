class Courses::MessagesWidget < Apotomo::Widget
  
  responds_to_event :add_message
  responds_to_event :activate_add_mode

  def display(course)
    render view: :display, locals: {course: course, messages: course.messages, message: Message.new, current_user: options[:current_user]}
  end

  def add_message(evt)
    message = Message.new(evt[:message])
    course = Course.find(evt[:course])
    course.messages << message
    course.save
    update({:state => :display}, course)
  end

end
