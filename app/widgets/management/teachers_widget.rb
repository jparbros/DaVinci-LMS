class Management::TeachersWidget < Apotomo::Widget
  responds_to_event :edit_mode
  responds_to_event :done
  responds_to_event :add_teacher
  responds_to_event :remove_teacher
  responds_to_event :search

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

  def remove_teacher(evt)
    teacher = User.find(evt[:teacher_id])
    course = Course.find(evt[:id])
    course.teachers.delete(teacher)
    render :state => :edit
  end

  def edit_mode(evt)
    render :state => :edit
  end

  def search(evt)
    users = User.search(evt[:query], :match => :all)
    candidates = users.collect { |user| {'teacher_id' => user.id, 'value' => "#{user.first_name} #{user.last_name}"} }
    render text: candidates.to_json
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
