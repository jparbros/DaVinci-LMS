class Management::Courses::StudentsWidget < Apotomo::Widget
  responds_to_event :edit_mode
  responds_to_event :done
  responds_to_event :add_student

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
      render :state => :edit
    end
  end
  
  def edit_mode(evt)
    render :state => :edit
  end
  
  def done(evt)
    update :state => :display
  end
  
  def candidates
    User.all.collect { |user| {'student_id' => user.id, 'value' => user.name} }
  end
end
