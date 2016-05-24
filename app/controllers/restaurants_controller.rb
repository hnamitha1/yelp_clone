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

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

end
