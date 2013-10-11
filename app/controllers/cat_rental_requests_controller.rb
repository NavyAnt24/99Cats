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

  def approve
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.approve!
    redirect_to cat_url(@cat_rental_request.cat_id)
  end

  def deny
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.deny!
    redirect_to cat_url(@cat_rental_request.cat_id)
  end

end