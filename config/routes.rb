Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  root 'top#index'
  devise_for :users
  resources :users, except: [:index]
  resources :posts, only: [:create, :destroy, :show] do
    resource :bookmarks, only: [:create, :destroy]
    get :bookmarks, on: :collection
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
