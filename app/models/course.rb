class Course < ActiveRecord::Base
  resourcify
  belongs_to :subject
end
