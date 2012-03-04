class Management::EditCourseWidget < Apotomo::Widget
  responds_to_event :submit
  
  def display
    @course = Course.find(params[:id])
    render
  end
  
  def submit(evt)
    @course = Course.find(evt[:id])
    if @course.update_attributes(evt[:course])
      trigger :course_edited
    else
      update :view => :display
    end
  end
end
