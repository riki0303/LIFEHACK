Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'homes#show'

  resources :posts do
    resource :like ,only: [:show,:create, :destroy]
    resources :comments, only: [:new, :create, :destroy]
  end

  resource :timeline, only: [:show]
  resources :favorites, only: [:index]

  resource :profile, only: [:show, :edit, :update]

  resources :accounts, only: [:show] do
    resource :follows, only: [:show, :create]
    resource :unfollows, only: [:show, :create]
    resources :followings, only: %i[index]
    resources :followers, only: %i[index]
  end
end
