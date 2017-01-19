Rails.application.routes.draw do
  root "main#landing"
  post "/app", to: "main#app"
  get "/app", to: "main#app"
  delete "/remove_city", to: "main#remove_city"
end
