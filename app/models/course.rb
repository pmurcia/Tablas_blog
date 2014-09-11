class Course < ActiveRecord::Base
  resourcify
  belongs_to :subject
  has_many :posts

  validates_uniqueness_of :name, scope: :subject_id
end
