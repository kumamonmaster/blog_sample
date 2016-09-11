Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root 'posts#index'
  devise_for :users

  resources :users, only: [:index, :edit, :update, :show] do
    resource :relationships, only: [:create, :destroy]
    get :favorites, on: :member
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :posts do
    resources :favorites, only: [:create, :destroy]
  end
end
