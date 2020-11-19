Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :users, except: [:index]
  resources :posts, only: [:create, :destroy] do
    resource :bookmarks, only: [:create, :destroy]
    get :bookmarks, on: :collection
  end
end
