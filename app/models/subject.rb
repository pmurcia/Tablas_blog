class Subject < ActiveRecord::Base
  resourcify
  has_many :courses
end
