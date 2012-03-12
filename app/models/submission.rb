class Submission
  include Mongoid::Document
  
  belongs_to :task
  belongs_to :user
  
end
