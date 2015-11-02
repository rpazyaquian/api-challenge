class ListingsController < ApplicationController
  def index
    @listings = Listing.includes([{photos: [{images: :thumbs}]}, :tags]).all
  end
  def create
    @listing = Listing.create(listing_params)
  end
  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
  end
  def show
    @listing = Listing.find(params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(:uuid, :active, :name, :email, :description, :address, :city, :state, :zipcode, :lat, :lng, :phone_number)
  end
end
