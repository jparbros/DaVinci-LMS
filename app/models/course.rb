class Course
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps::Updated
  
  field :full_name, type: String
  field :abbreviation, type: String
  field :description, type: String
  
  search_in :full_name, :abbreviation
  
  validates :full_name, :presence => true
  validates :abbreviation, :presence => true  
  validates :abbreviation, :uniqueness => true
end
