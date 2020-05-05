Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'
  root "currencies#index"

  get "/", to: "currencies#index"
  
  namespace :admin do
    get "/", to: "currencies#new", as: "form"
    post "/", to: "currencies#create", as: "create"
    patch "/", to: "currencies#update", as: "update"
  end
end
