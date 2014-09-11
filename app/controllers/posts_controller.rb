class PostsController < ApplicationController
  before_action :set_course!

  def index
  	@posts = @course.posts.all
  end

  def show
  	@post = @course.posts.find params[:id]
  end

  private

  def set_course!
  	@subject = Subject.find params[:subject_id]
  	@course = @subject.courses.find params[:course_id]
  end
end
