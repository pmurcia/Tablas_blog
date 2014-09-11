class Course < ActiveRecord::Base
  resourcify
  belongs_to :subject
  has_many :posts
  
  friendly_id :name, use: :slugged

  validates_uniqueness_of :name, scope: :subject_id
end
