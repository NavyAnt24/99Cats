class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    render :new
  end

  def create
    @rental = CatRentalRequest.new(params[:rental])

    if @rental.save
      redirect_to cat_url(@rental.cat_id)
    else
      redirect_to :new
    end
  end

end