class CoursesController < ApplicationController
  before_filter :set_subject!

  def index
  	redirect_to action: 'show', controller: 'subjects', id: @subject
  end

  def show
  	@course = @subject.courses.find params[:id]
  end

  def new
  	@course = @subject.courses.new
  end

  def create
  	@course = @subject.courses.create name: params[:course][:name], subject_id: @subject

  	if @course.save
  	  redirect_to action: 'show', controller: 'subjects', id: @subject.id
  	else
  	  render 'new'
  	end
  end

  def edit
  	@course = @subject.courses.find params[:id]
  end

  def update
  	@course = @subject.courses.find params[:id]
  	@course.update name: params[:course][:name]

  	if @subject.valid?
  	  redirect_to action: 'show', controller: 'courses'
  	else
  	  render 'edit'
  	end 
  end

  def destroy
  	@course = @subject.courses.find params[:id]

  	if @course.destroy
  	  flash[:notice] = 'Borrada con éxito'
  	  redirect_to action: 'show', controller: 'subjects', id: @course.subject
  	else
  	  flash[:notice] = 'Borrada con éxito'
  	  redirect_to action: 'show', controller: 'subjects', id: @course.subject
  	end
  end

  private

  def set_subject!
  	@subject = Subject.find params[:subject_id]
  end
end
