class Management::Courses::NewCourseWidget < Apotomo::Widget
  responds_to_event :submit
  helper :application

  def display
    @course = Course.new
    render
  end

  def submit(evt)
    @course = Course.new(params[:course])
    if @course.save
      @message = "Course <a href='/management/courses/#{@course.id}'>#{@course.full_name}</a> saved"
      @course = Course.new
      update :view => :display
    else
      update :view => :display
    end
  end

end
