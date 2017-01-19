class Admin::RestaurantsController < Admin::BaseController

  before_action :find_restaurant, only: [:edit, :show,:update,:destroy]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    @specialities = Speciality.all
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
    @specialities = Speciality.all

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

  def show

  end

  private
   def restaurant_params
     params.require(:restaurant).permit(:name, :image, :stars, :speciality_id)
   end
   def find_restaurant
     @restaurant = Restaurant.find(params[:id])
   end
end
