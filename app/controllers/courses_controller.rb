class CoursesController < ApplicationController
  def index
  	# binding.pry
  	subject = Subject.find params[:subject_id]
  	@courses = subject.courses.all
  end

  def show
  	subject = Subject.find params[:subject_id]
  	@course = subject.courses.find params[:id]
  end

  def new
  	@subject = Subject.find params[:subject_id]
  	@course = @subject.courses.new
  end

  def create
  	@subject = Subject.find params[:subject_id]
  	@course = @subject.courses.create name: params[:course][:name], subject_id: @subject

  	if @course.save
  	  redirect_to action: 'show', controller: 'subjects', id: @subject.id
  	else
  	  render 'new'
  	end
  end
end
