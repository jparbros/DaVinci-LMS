class Management::Courses::StudentsWidget < Apotomo::Widget
  responds_to_event :set_add_mode
  responds_to_event :set_remove_mode
  responds_to_event :done
  responds_to_event :add_student
  responds_to_event :remove_student
  
  helper :application

  def display
    @course = Course.find(params[:id])
    @students = @course.students
    render
  end
  
  def set_remove_mode(evt)
    render :state => :remove_mode
  end
  
  def remove_mode
    @course = Course.find(params[:id])
    @students = @course.students
    @candidates = candidates(@students)
    update :view => :remove
  end
  
  def remove_student(evt)
    student = User.find(evt[:student_id])
    course = Course.find(evt[:id])
    course.students.delete(student)
    @message = "#{student.name} is no longer a student in #{course.abbreviation}"
    render :state => :remove_mode
  end
  
  def set_add_mode(evt)
    render :state => :add_mode
  end
  
  def add_mode
    @course = Course.find(params[:id])
    @students = @course.students
    @candidates = candidates(User.not_in(_id: @course.student_ids))
    update :view => :add
  end
  
  def add_student(evt)
    student = User.find(evt[:student_id])
    @course = Course.find(evt[:id])
    @course.students << student
    if @course.save
      @message = "#{student.name} has been added as a student in #{@course.abbreviation}"
      render :state => :add_mode
    end
  end
  
  def done(evt)
    update :state => :display
  end
  
  def candidates(users=[])
    if users.empty?
      return User.all.collect { |user| {'student_id' => user.id, 'value' => user.name} }
    else
      return users.collect { |user| {'student_id' => user.id, 'value' => user.name} }
    end
  end
end
