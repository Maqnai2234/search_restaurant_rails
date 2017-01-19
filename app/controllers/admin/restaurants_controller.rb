class Admin::RestaurantsController < Admin::BaseController

  before_action :find_restaurant, only: [:edit, :show,:update,:destroy]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new restaurant_params
    if @restaurant.save
      redirect_to admin_restaurants_path
    else
      render 'new'
    end
  end

  def edit

  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  def update
    if @restaurant.update restaurant_params
      redirect_to admin_restaurants_path
    else
      render 'edit'
    end
  end

  private
   def restaurant_params
     params.require(:restaurant).permit(:name, :image, :stars)
   end
   def find_restaurant
     @restaurant = Restaurant.find(params[:id])
   end
end
