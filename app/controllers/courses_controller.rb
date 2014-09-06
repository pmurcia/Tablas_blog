class CoursesController < ApplicationController
  def index
  	@courses = Course.all
  end

  def show
  	@course = Course.find params[:id]
  end

  def new
  	@course = Course.new
  end

  def create
  	@subject = Subject.find params[:id]
  	@course = Course.create name: params[:course][:name], subject_id: @subject

  	if @course.save
  	  redirect_to action: 'index', controller: 'courses', id: @subject.id
  	else
  	  render 'new'
  	end
  end
end
