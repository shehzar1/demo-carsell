Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :ads do
    member do
      get :favorites
      get :unfavorite
      get :close
    end
    collection do
      get :user_favorites
      get :user_ads
    end
  end

  resources :ad_steps
  get 'home/index'
end
