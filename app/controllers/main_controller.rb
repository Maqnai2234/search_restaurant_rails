class MainController < ApplicationController
  before_action :check_city_selected, only: [:landing]
  def landing
    @cities = City.all

  end

  def city_selected
    if params[:city].nil?
      if session[:city].nil?
        redirect_to root_path
      end
    else
      session[:city] = params[:city]
    end
  end

  def check_city_selected
    unless session[:city].nil?
      redirect_to city_selected_path
    end
  end
end
