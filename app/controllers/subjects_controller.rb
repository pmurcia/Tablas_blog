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
end
