Rails.application.routes.draw do
  get 'charges/new'
  get 'charges/create'
  root to: "home#index"
  devise_for :users
  resources :ads do
    collection do
      get 'favorites'
    end
  end
  resources :ad_steps
  resources :charges, only: [:new, :create]
  get 'home/index'
end
