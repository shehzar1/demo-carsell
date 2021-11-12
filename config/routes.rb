Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :ads do
    member do
      get :favorites
      get :unfavorite
    end
    collection do
      get :myfavorites
    end
  end
  resources :ad_steps
  get 'home/index'
end
