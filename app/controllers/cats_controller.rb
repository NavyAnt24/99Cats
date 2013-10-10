class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    @rental = @cat.cat_rental_requests
  end

  def create
    @cat = Cat.new(params[:cat])
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :text => @cat.errors.full_messages
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(params[:cat])
      redirect_to cat_url(@cat)
    else
      render :text => @cat.errors.full_messages
    end
  end

  def new
    @cat = Cat.new
  end


end
