class ListingsController < ApplicationController
  def index
    @listings = Listings.all
    render json: @listings
  end
end
