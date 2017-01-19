class Admin::CitiesController < Admin::BaseController
  before_action :find_city, only: [:show,:edit,:update,:destroy]
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new city_params
    if @city.save
      redirect_to admin_cities_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @city.update city_params
      redirect_to admin_cities_path
    else
      render 'edit'
    end
  end

  def destroy
    @city.destroy
    redirect_to admin_cities_path
  end
  private
    def city_params
      params.require(:city).permit(:name)
    end

    def find_city
      @city = City.find(params[:id])
    end

end
