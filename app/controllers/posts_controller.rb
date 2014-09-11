class PostsController < ApplicationController
  before_action :set_course!

  def index
  	@posts = @course.posts.all
  end

  def show
  	@post = @course.posts.find params[:id]
  end

  def new
    @post = @course.posts.new
  end

  def create
    @post = @course.posts.create title: params[:post][:title], content: params[:post][:content]

    if @post.save
      flash[:notice] = 'Creada satisfactoriamente'
      redirect_to action: 'show', controller: 'courses', subject_id: @subject, id: @course
    else
      flash[:alert] = 'No se ha podido crear'
      render 'new'
    end
  end

  private

  def set_course!
  	@subject = Subject.find params[:subject_id]
  	@course = @subject.courses.find params[:course_id]
  end
end
