class Admin::ZonesController < Admin::BaseController
  before_action :find_restaurant
  before_action :find_zone, only: [:edit, :update,:destroy]
  def new

    @zone = Zone.new
    @cities = City.all
  end

  def create
    @zone = Zone.new zone_params
    @zone.restaurant = @restaurant

    if @zone.save
      redirect_to admin_restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit
    @cities = City.all
  end

  def update
    if @zone.update zone_params
      redirect_to admin_restaurant_path(@restaurant)
    else
      render 'edit'
    end
  end

  def destroy
    @zone.destroy
    redirect_to admin_restaurant_path(@restaurant)
  end

  private
    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def zone_params
      params.require(:zone).permit(:address,:schedule,:city_id)
    end

    def find_zone
      @zone = Zone.find(params[:id])
    end
end
