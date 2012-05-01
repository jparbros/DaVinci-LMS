class Courses::TodoListWidget < Apotomo::Widget

  responds_to_event :add_todo
  responds_to_event :mark_as_completed

  def display(course)
    todos = options[:current_user].todos.where(course_id: course.id)
    render :view => :display, locals: {course: course, todo: Todo.new, todos: todos}
  end

  def add_todo(evt)
    course = Course.find(evt[:course])
    user = options[:current_user]
    todo = Todo.new(content: evt[:todo][:content], course: course, user: user)
    todo.save
    update({:state => :display}, course)
  end

  def mark_as_completed(evt)
    course = Course.find(evt[:course])
    todo = Todo.find(evt[:todo])
    todo.destroy
    update({:state => :display}, course)
  end

end
