class Task
  include Mongoid::Document

  field :description, type: String
  field :title, type: String
  field :last_day_to_submit, type: Date, default: Date.current

  validates :title, :presence => true
  validates :last_day_to_submit, :presence => true
  validates :description, :presence => true
  
  has_many :submissions

  belongs_to :course
end