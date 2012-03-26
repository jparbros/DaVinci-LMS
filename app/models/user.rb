class User
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps

  authenticates_with_sorcery!

  field :first_name, type: String
  field :last_name, type: String
  field :dni, type: String
  field :email, type: String
  field :password, type: String

  attr_accessible :first_name, :last_name, :dni, :email, :password

  default_scope asc(:first_name, :last_name)

  has_and_belongs_to_many :student_in, class_name: 'Course', inverse_of: :students
  has_and_belongs_to_many :teacher_in, class_name: 'Course', inverse_of: :teachers
  has_many :submissions

  validates :dni, :presence => true
  validates :email, :presence => true
  validates :first_name, :presence => true

  search_in :first_name, :last_name, :dni, :email

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def teacher?(course)
    self.teacher_in_ids.include?(course.id)
  end

  def student?(course)
    self.student_in_ids.include?(course.id)
  end

end
