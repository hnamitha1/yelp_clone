class RestaurantsController < ApplicationController
  def index
    #raise 'Hello from the index action'
    @restaurants = Restaurant.all
  end

  def new
  	@restaurant = Restaurant.new
  end

  def create
  	Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
  end

  def show
	  @restaurant = Restaurant.find(params[:id])
	end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    redirect_to '/restaurants'
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

end
