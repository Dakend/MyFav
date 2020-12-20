Rails.application.routes.draw do
  root 'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :update]
  resources :tags, only: [:show]
  resources :categories, only: [:show]
  resources :posts, only: [:create, :destroy, :show] do
    resource :bookmarks, only: [:create, :destroy]
    get :bookmarks, on: :collection
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
