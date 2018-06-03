Rails.application.routes.draw do
  devise_for :users
  resources :moviedataas do
    member do
      post :join
      post :quit
    end
    resources :posts
  end
  root 'moviedataas#index'
end
