Rails.application.routes.draw do
  root 'top#index'
  get 'posts/index'
  devise_for :users
  resources :users, except: [:index]
  resources :posts, only: [:create, :destroy]
end
