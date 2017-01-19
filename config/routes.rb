Rails.application.routes.draw do
  root "main#landing"
  post "/city_selected", to: "main#city_selected"
  get "/city_selected", to: "main#city_selected"
end
