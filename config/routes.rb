Rails.application.routes.draw do
  root 'top#index'
  get  '/about', to: 'statics#about'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
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
