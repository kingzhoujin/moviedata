Rails.application.routes.draw do
  resources :moviedataas
  root 'moviedataas#index'
end
