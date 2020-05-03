Rails.application.routes.draw do
  get "/", to: "currencies#index"
end
