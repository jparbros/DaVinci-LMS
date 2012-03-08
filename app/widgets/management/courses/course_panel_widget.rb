class Management::Courses::CoursePanelWidget < Apotomo::Widget
  responds_to_event :course_edited
  helper :application

  has_widgets do |root|
    root << widget('management/courses/edit_course', :edit_course)
    root << widget('management/courses/teachers', :teachers)
    root << widget('management/courses/students', :students)
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
