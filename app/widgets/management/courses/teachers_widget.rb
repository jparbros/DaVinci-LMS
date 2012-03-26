class Management::Courses::TeachersWidget < Apotomo::Widget
  responds_to_event :set_add_mode
  responds_to_event :set_remove_mode
  responds_to_event :done
  responds_to_event :add_teacher
  responds_to_event :remove_teacher
  
  helper :application

  def display
    @course = Course.find(params[:id])
    @teachers = @course.teachers
    render
  end
  
  def set_remove_mode(evt)
    render :state => :remove_mode
  end

  def remove_mode
    @course = Course.find(params[:id])
    @teachers = @course.teachers
    @candidates = candidates(@teachers)
    update :view => :remove
  end

  def remove_teacher(evt)
    teacher = User.find(evt[:teacher_id])
    course = Course.find(evt[:id])
    course.teachers.delete(teacher)
    @message = "Removed <a href='/management/users/#{teacher.id}'>#{teacher.name}</a> from <a href='/management/courses/#{course.id}'>#{course.full_name}</a>"
    render :state => :remove_mode
  end
  
  def set_add_mode(evt)
    render :state => :add_mode
  end

  def add_mode
    @course = Course.find(params[:id])
    @teachers = @course.teachers
    @candidates = candidates(User.not_in(_id: @course.teacher_ids))
    update :view => :add
  end

  def add_teacher(evt)
    teacher = User.find(evt[:teacher_id])
    @course = Course.find(evt[:id])
    @course.teachers << teacher
    if @course.save
      @message = "Added <a href='/management/users/#{teacher.id}'>#{teacher.name}</a> as a teacher in <a href='/management/courses/#{@course.id}'>#{@course.full_name}</a> "
      render :state => :add_mode
    end
  end

  def done(evt)
    update :state => :display
  end
  
  def teacher(teacher)
    render :view => :teacher, :locals => { teacher: teacher}
  end

  def candidates(users=[])
    if users.empty?
      return User.all.collect { |user| {'teacher_id' => user.id, 'value' => user.name} }
    else
      return users.collect { |user| {'teacher_id' => user.id, 'value' => user.name} }
    end
  end

end
