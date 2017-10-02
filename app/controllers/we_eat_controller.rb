class WeEatController < ApplicationController

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

end
