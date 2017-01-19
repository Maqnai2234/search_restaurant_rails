class Admin::PhonesController < Admin::BaseController
  before_action :find_zone
  before_action :find_phone, only: [:edit,:show,:destroy,:update]
  def new
    @phone = Phone.new
  end
  def edit

  end
  def create
    @phone = Phone.new phone_params
    @phone.zone = @zone

    if @phone.save
      redirect_to admin_restaurant_zone_path(@zone.restaurant,@zone)
    else
      render 'new'
    end
  end

  def destroy
    @phone.destroy
    redirect_to admin_restaurant_zone_path(@zone.restaurant,@zone)
  end

  def update
    if @phone.update phone_params
      redirect_to admin_restaurant_zone_path(@zone.restaurant,@zone)
    else
      render 'edit'
    end
  end

  private
    def find_phone
      @phone = Phone.find(params[:id])
    end
    def find_zone
      @zone = Zone.find(params[:zone_id])
    end

    def phone_params
      params.require(:phone).permit(:number)
    end

end
