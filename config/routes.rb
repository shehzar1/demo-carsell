Rails.application.routes.draw do
  get 'charges/new'
  get 'charges/create'
  root to: "home#index"
  devise_for :users

  resources :ads do
    member do
      get :favorites
      get :unfavorite
      get :close
    end
    collection do
      get :myfavorites
      get :myposts
    end
  end

  resources :ad_steps

  resources :charges, only: [:new, :create]
  get 'home/index'
end
