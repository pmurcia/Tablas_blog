class Subject < ActiveRecord::Base
  resourcify
  has_many :courses

  validates_uniqueness_of :name
end
