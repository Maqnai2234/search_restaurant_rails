class MainController < ApplicationController
  def landing
    @cities = City.all
  end
end
