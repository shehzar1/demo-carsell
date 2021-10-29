Rails.application.routes.draw do
  resources :ads
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
