Rails.application.routes.draw do
  devise_for :users
  resources :moviedataas do
    resources :posts 
  end
  root 'moviedataas#index'
end
