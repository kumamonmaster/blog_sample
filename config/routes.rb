Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root 'posts#index'
  devise_for :users

  resources :users, only: [:index, :show] do
    get :favorites, on: :member
  end
  
  resources :posts do
    resources :favorites, only: [:create, :destroy]
  end
end
