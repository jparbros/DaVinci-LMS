class Submissions::SubmissionPanelWidget < Apotomo::Widget
  helper :application

  responds_to_event :submit_submission

  def display(user, course, submission)
    @user= user
    @course = course
    @submission = submission
    @task = @submission.task
    render
  end

  def breadcrumb(user, course, submission, task)
    if user.teacher?(course)
      render :view => :breadcrumb_teacher,
      :locals => {course: course, submission: submission, task: task}
    else
      render :view => :breadcrumb_student,
      :locals => {course: course, submission: submission, task: task}
    end
  end

  def task(task)
    render :view => :task, :locals => {:task => task}
  end

  def submission(submission)
    render :view => :submission, :locals => {:submission => submission}
  end

  def submit_submission(evt)
    user = options[:user]
    submission = user.submissions.find(evt[:submission_id])
    submission.comment = evt[:submission][:comment]
    submission.save
    update "#submission", {:state => :submission}, submission
  end

end
