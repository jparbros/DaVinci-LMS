class Task
  include Mongoid::Document
  
  field :description, type: String
  field :title, type: String
  field :last_day_to_submit, type: Date, default: Date.current
  
  validates :title, :presence => true
  validates :last_day_to_submit, :presence => true
  validates :description, :presence => true  
  
  belongs_to :course
end