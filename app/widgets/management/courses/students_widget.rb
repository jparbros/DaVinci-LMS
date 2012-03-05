class Management::Courses::StudentsWidget < Apotomo::Widget
  responds_to_event :edit_mode
  responds_to_event :done
  responds_to_event :add_student
  responds_to_event :remove_student

  def display
    @course = Course.find(params[:id])
    @students = @course.students
    render
  end

  def edit
    @course = Course.find(params[:id])
    @students = @course.students
    @candidates = candidates
    update :view => :edit
  end
  
  def add_student(evt)
    student = User.find(evt[:student_id])
    @course = Course.find(evt[:id])
    @course.students << student
    if @course.save
      @message = "#{student.name} has been added as a student"
      render :state => :edit
    end
  end
  
  def remove_student(evt)
    student = User.find(evt[:student_id])
    course = Course.find(evt[:id])
    course.students.delete(student)
    @message = "#{student.name} is no longer a student in #{course.abbreviation}"
    render :state => :edit
  end
  
  def edit_mode(evt)
    render :state => :edit
  end
  
  def done(evt)
    update :state => :display
  end
  
  def candidates(users=[])
    if users.empty?
      return User.all.collect { |user| {'teacher_id' => user.id, 'value' => user.name} }
    else
      return users.collect { |user| {'teacher_id' => user.id, 'value' => user.name} }
    end
  end
end
