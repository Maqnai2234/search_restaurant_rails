class Admin::SpecialitiesController < Admin::BaseController
  before_action :find_speciality, only: [:show,:edit,:update,:destroy]
  def index
    @specialities = Speciality.all
  end

  def new
    @speciality = Speciality.new
  end

  def create
    @speciality = Speciality.new speciality_params
    if @speciality.save
      redirect_to admin_specialities_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @speciality.update speciality_params
      redirect_to admin_specialities_path
    else
      render 'edit'
    end
  end

  def destroy
    @speciality.destroy
    redirect_to admin_specialities_path
  end
  private
    def speciality_params
      params.require(:speciality).permit(:name)
    end

    def find_speciality
      @speciality = Speciality.find(params[:id])
    end
end
