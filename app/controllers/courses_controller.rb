class CoursesController < ApplicationController
  # COMPROBAR BASE DE DATOS. has_and_belogs_to_many : ... ???
  before_filter :set_subject!, except: [:index_student]
  before_filter :authenticate_user!

  def index
  	redirect_to action: 'show', controller: 'subjects', id: @subject
  end

  def index_student
    @course = Course.friendly.find params[:id]
    render 'index_student'
  end

  def show
  	@course = @subject.courses.friendly.find params[:id]
    @posts = @course.posts.all
  end

  def new
  	@course = @subject.courses.new
  end

  def create
  	@course = @subject.courses.create name: params[:course][:name], subject_id: @subject.slug 
  	# binding.pry
    if @course.save
      flash[:notice] = 'Creada satisfactoriamente'
  	  redirect_to action: 'show', controller: 'subjects', id: @subject.slug
  	else
      flash[:alert] = 'No se ha podido crear. ¿Te has asegurado de que no existe?'
  	  render 'new'
  	end
  end

  def edit
  	@course = @subject.courses.friendly.find params[:id]
  end

  def update
  	@course = @subject.courses.friendly.find params[:id]
  	@course.update name: params[:course][:name]

  	if @course.valid?
      flash[:notice] = 'Modificada satisfactoriamente'
  	  redirect_to action: 'show', controller: 'courses'
  	else
      flash[:alert] = 'No se puede modificar. ¿Te has asegurado de que no exista?'
  	  render 'edit'
  	end 
  end

  def destroy
  	@course = @subject.courses.friendly.find params[:id]

  	if @course.destroy
  	  flash[:notice] = 'Borrada con éxito'
  	  redirect_to action: 'show', controller: 'subjects', id: @course.subject
  	else
  	  flash[:notice] = 'No ha podido ser borrada'
  	  redirect_to action: 'show', controller: 'subjects', id: @course.subject
  	end
  end

  private

  def set_subject!
  	@subject = Subject.friendly.find params[:subject_id]
  end
end
