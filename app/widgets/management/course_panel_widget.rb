class Management::CoursePanelWidget < Apotomo::Widget
  responds_to_event :course_edited

  has_widgets do |root|
    root << widget('management/edit_course', :edit_course)
  end

  def display()
    @course = Course.find(params[:id])
    render
  end
  
  def course_edited(evt)
    @message = 'Course edited'
    @course = Course.find(params[:id])
    update :view => :display
  end
end
