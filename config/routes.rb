Rails.application.routes.draw do
  root to: 'posts#index'
  get 'posts/index'
  devise_for :users
  resources :users, except: [:index]
  resources :posts
end
