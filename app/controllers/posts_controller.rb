class PostsController < ApplicationController
  before_action :set_course!

  def index
  	redirect_to action: 'show', controller: 'courses', subject_id: @subject, id: @course
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

  def edit
    @post = @course.posts.find params[:id]
  end

  def update
    @post = @course.posts.find params[:id]
    @post.update title: params[:post][:title], content: params[:post][:content]

    if @post.valid?
      flash[:notice] = 'Modificada satisfactoriamente'
      redirect_to action: 'show', controller: 'courses', subject_id: @subject, id: @course
    else
      flash[:alert] = 'No se puede modificar.'
      render 'edit'
    end
  end

  def destroy
    @post = @course.posts.find params[:id]

    if @post.destroy
      flash[:notice] = 'Borrada con éxito'
      redirect_to action: 'show', controller: 'courses', subject_id: @subject, id: @course
    else
      flash[:notice] = 'No ha podido ser borrada'
      redirect_to action: 'show', controller: 'courses', subject_id: @subject, id: @course
    end
  end

  private

  def set_course!
  	@subject = Subject.find params[:subject_id]
  	@course = @subject.courses.find params[:course_id]


  end
end
