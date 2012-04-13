class Management::Courses::IndexPanelWidget < Apotomo::Widget

  responds_to_event :activate_remove_mode
  responds_to_event :done
  responds_to_event :remove

  helper :application
  include ApplicationHelper

  def display(courses)
    render locals: {courses: courses}
  end

  def activate_remove_mode(evt)
    courses = Course.all
    update view: :remove_mode, locals: { courses: courses, candidates: candidates(courses)}
  end

  def remove(evt)
    course = Course.find(evt[:course_id])
    if course.delete
      alert_message(:success, "Course <b>#{course.full_name}</b> deleted")
    end
    trigger :activate_remove_mode
  end

  def done(evt)
    replace({:state => :display}, Course.all)
  end

  private
    def candidates(courses = [])
      courses.map.each { |course| {'course_id' => course.id, 'value' => "#{course.abbreviation}  #{course.full_name}"} }
    end

end
