class Management::TeachersWidget < Apotomo::Widget
  responds_to_event :edit_mode
  responds_to_event :done
  responds_to_event :add_teacher

  def display
    @course = Course.find(params[:id])
    @teachers = @course.teachers
    render
  end
  
  def edit
    @course = Course.find(params[:id])
    @teachers = @course.teachers
    @candidates = candidates
    update :view => :edit    
  end

  def edit_mode(evt)
    render :state => :edit
  end

  def done(evt)
    update :state => :display
  end

  def add_teacher(evt)
    teacher = User.find(evt[:teacher_id])
    @course = Course.find(evt[:id])
    @course.teachers << teacher
    if @course.save
      render :state => :edit
    end
  end
  
  def candidates
    User.all.collect { |user| {'teacher_id' => user.id, 'value' => "#{user.first_name} #{user.last_name}"} }
  end

end
