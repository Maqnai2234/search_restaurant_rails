Rails.application.routes.draw do
  root "main#landing"
  post "/app", to: "main#app"
  get "/app", to: "main#app"
  delete "/remove_city", to: "main#remove_city"

  namespace :admin do
    get '/dashboard', to: "dashboard#index"
    resources :restaurants do
      resources :zones, only: [:new,:create,:edit,:update,:destroy]
    end
    resources :cities
    resources :specialties
  end

  get '/admin' => redirect('/admin/dashboard')
end
