class Admin::PhonesController < Admin::BaseController
  def new
    @zone = Zone.find(params[:zone_id])
    @phone = Phone.new
  end
  def edit

  end
  def create
  end

  def show
  end
  def destroy
  end 
end
