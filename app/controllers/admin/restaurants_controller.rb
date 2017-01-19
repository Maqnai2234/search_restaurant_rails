class Admin::RestaurantsController < Admin::BaseController
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

  end

  def update
  end

  private
   def restaurant_params
     params.require(:restaurant).permit(:name, :image, :stars)
   end
   def find_restaurant
   end
end
