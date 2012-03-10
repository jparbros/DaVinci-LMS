class Task
  include Mongoid::Document
  
  field :description, type: String
  field :title, type: String
  field :last_day_to_submit, type: Date, default: Date.current
  
  belongs_to :course
end