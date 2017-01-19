class MainController < ApplicationController
  before_action :check_city_selected, only: [:landing]
  def landing
    @cities = City.all

  end

  #Method GET/POST
  def app
    if params[:city].nil?
      if session[:city].nil?
        redirect_to root_path
      else
        find_city
        app_content
      end
    else
      session[:city] = params[:city]
      find_city
      app_content
    end
  end

  #Method DELETE
  def remove_city
    session.delete(:city)
    redirect_to root_path
  end
  private
    def check_city_selected
      unless session[:city].nil?
        redirect_to app_path
      end
    end

    def find_city
      @city = City.find(session[:city])
      @string_welcome = "Te encuentras en: #{@city.name}"
    end

    def app_content
      permitted = params.permit(:speciality,:zone,:name)
      if permitted[:speciality].present? || permitted[:zone].present? || permitted[:name].present?
        speciality = permitted[:speciality]
        zone = permitted[:zone]
        name = permitted[:name]
        @restaurants = Kaminari.paginate_array(@city.restaurants.search_filter(speciality,zone,name).distinct).page(params[:page]).per(10)
      else
        @restaurants = Kaminari.paginate_array(@city.restaurants.distinct).page(params[:page]).per(10)

      end
    end
end
