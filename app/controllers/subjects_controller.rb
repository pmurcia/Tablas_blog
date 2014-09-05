class SubjectsController < ApplicationController
  def index
  	@subjects = Subject.all.order(created_at: :asc)
  end

  def show
  	@subject = Subject.find params[:id]
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

  end
end
