Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'top#index'
  devise_for :users
  resources :users, except: [:index]
  resources :posts, only: [:create, :destroy, :show] do
    resource :bookmarks, only: [:create, :destroy]
    get :bookmarks, on: :collection
    resource :favorites, only: [:create, :destroy]
  end
end
