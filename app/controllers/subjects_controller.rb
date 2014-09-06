class SubjectsController < ApplicationController
  def index
  	@subjects = Subject.all.order(created_at: :asc)
  	@courses = Course.all
  end

  def show
  	@subject = Subject.find params[:id]
  	@course = Course.first
  end

  def new
  	@subject = Subject.new
  end

  def create
  	@subject = Subject.create name: params[:subject][:name]

  	if @subject.save
  	  redirect_to action: 'index', controller: 'subjects'
  	else
  	  render 'new'
  	end
  end

  def edit
  	@subject = Subject.find params[:id]
  end

  def update
  	@subject = Subject.find params[:id]
  	@subject.update name: params[:subject][:name]

  	if @subject.valid?
  	  redirect_to action: 'index', controller: 'subjects'
  	else
  	  render 'edit'
  	end 
  end

  def destroy
  	@subject = Subject.find params[:id]

  	if @subject.destroy
  	  flash[:notice] = 'Borrada con éxito'
  	  redirect_to action:'index', controller:'subjects'
  	else
  	  flash[:notice] = 'No ha podido ser borrada'
  	  redirect_to action:'index', controller:'subjects'
  	end
  end
end
