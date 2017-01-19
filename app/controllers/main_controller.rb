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
      end
    else
      session[:city] = params[:city]
      find_city
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
      city = City.find(session[:city]).name
      @string_welcome = "Te encuentras en: #{city}"
    end

end
