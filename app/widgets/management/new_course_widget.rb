class Management::NewCourseWidget < Apotomo::Widget
  responds_to_event :submit

  def display
    @course = Course.new
    render
  end

  def submit(evt)
    @course = Course.new(params[:course])
    if @course.save
      @message = 'Course saved'
      @course = Course.new
      update :view => :display
    else
      update :view => :display
    end
  end

end
