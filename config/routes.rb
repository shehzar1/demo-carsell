Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :ads
  get 'home/index'
end
