class Management::TeachersWidget < Apotomo::Widget
  responds_to_event :edit
  responds_to_event :done
  responds_to_event :add_teacher

  def display
    @course = Course.find(params[:id])
    @teachers = @course.teachers
    render
  end

  def edit(evt)
    @course = Course.find(params[:id])
    @teachers = @course.teachers
    @users = candidates
    update :view => :edit
  end

  def done(evt)
    update :state => :display
  end

  def add_teacher(evt)
    teacher = User.find(evt[:teacher_id])
    @course = Course.find(evt[:id])
    @course.teachers << teacher
    @users = candidates
    if @course.save
      @teachers = @course.teachers
      update :view => :edit
    end
  end
  
  def candidates
    User.all.collect { |user| {'teacher_id' => user.id, 'value' => "#{user.first_name} #{user.last_name}"} }
  end

end
