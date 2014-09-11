class Subject < ActiveRecord::Base
  resourcify
  friendly_id :name, use: :slugged
  
  has_many :courses

  validates_uniqueness_of :name
end
