class Course
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps::Updated
  
  field :full_name, type: String
  field :abbreviation, type: String
  field :description, type: String
  
  search_in :full_name, :abbreviation
  
  has_and_belongs_to_many :students, class_name: 'User', inverse_of: :student_in
  has_and_belongs_to_many :teachers, class_name: 'User', inverse_of: :teacher_in
  
  validates :full_name, :presence => true
  validates :abbreviation, :presence => true  
  validates :abbreviation, :uniqueness => true
end
