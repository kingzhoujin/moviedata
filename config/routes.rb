Rails.application.routes.draw do
  devise_for :users
  resources :moviedataas do
    member do
      post :join
      post :quit
    end
    resources :posts
  end

  namespace :account do
    resources :moviedataas
  end
  
  root 'moviedataas#index'
end
