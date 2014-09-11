class Course < ActiveRecord::Base
  resourcify
  belongs_to :subject

  validates_uniqueness_of :name, scope: :subject_id
end
