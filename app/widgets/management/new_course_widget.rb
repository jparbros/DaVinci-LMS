class Management::NewCourseWidget < Apotomo::Widget
  responds_to_event :submit

  def display
    @course = Course.new
    render
  end

end
