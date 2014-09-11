class Post < ActiveRecord::Base
  belongs_to :course

  extend FriendlyId
  friendly_id :title, use: :slugged
end
