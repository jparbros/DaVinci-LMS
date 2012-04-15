class Submission
  include Mongoid::Document
    
  field :comment, type: String
  field :uploads, type: Array, default: Array.new
  field :mark, type: String
  
  belongs_to :task
  belongs_to :user
  
  before_destroy do |submission|    
    submission.uploads.each { |upload| RemoveUploadContext.call(submission, upload) }
  end
  
  def archived?
    self.task.last_day_to_submit < Date.today
  end
  
  def active?
    self.task.last_day_to_submit >= Date.today
  end
  
end
