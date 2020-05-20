Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :movies
  resources :movies do
    resource :favorites, only: [:create, :destroy]
  end
  resources :movies do
    resources :reviews
  end

end
