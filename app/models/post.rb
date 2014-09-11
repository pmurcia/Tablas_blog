class Post < ActiveRecord::Base
  belongs_to :course

  friendly_id :title, use: :slugged
end
