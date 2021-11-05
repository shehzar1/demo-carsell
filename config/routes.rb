Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :ads do
    collection do
      get 'favorites'
    end
  end
  resources :ad_steps
  get 'home/index'
end
