class PostsController < ApplicationController
  before_action :set_course!

  def index
  	@posts = Post.all
  end

  private

  def set_course!

  end
end
