class SubjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  
  def index
  	@subjects = Subject.all.order(created_at: :asc)
  end

  def show
  	@subject = Subject.friendly.find params[:id]
  end

  def new
  	@subject = Subject.new
  end

  def create
    # binding.pry
  	@subject = Subject.create name: params[:subject][:name]

  	if @subject.save
  	  redirect_to action: 'index', controller: 'subjects'
  	else
  	  render 'new'
  	end
  end

  def edit
  	@subject = Subject.friendly.find params[:id]
  end

  def update
  	@subject = Subject.friendly.find params[:id]
  	@subject.update name: params[:subject][:name]

  	if @subject.valid?
  	  redirect_to action: 'index', controller: 'subjects'
  	else
  	  render 'edit'
  	end 
  end

  def destroy
  	@subject = Subject.friendly.find params[:id]

  	if @subject.destroy
  	  flash[:notice] = 'Borrada con éxito'
  	  redirect_to action:'index', controller:'subjects'
  	else
  	  flash[:notice] = 'No ha podido ser borrada'
  	  redirect_to action:'index', controller:'subjects'
  	end
  end
end
