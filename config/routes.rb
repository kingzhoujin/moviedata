Rails.application.routes.draw do
  devise_for :users
  resources :moviedataas
  root 'moviedataas#index'
end
