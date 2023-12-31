Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root 'homes#show'

  resources :posts do
    resource :like ,only: [:show,:create, :destroy]
    resources :comments, only: [:new, :create, :destroy]
    collection do
      get 'search'
    end
  end

  resource :timeline, only: [:show]
  resources :favorites, only: [:index]

  resource :profile, only: [:show, :edit, :update]

  resources :accounts, only: [:show] do
    resource :follow, only: [:show, :create]
    resource :unfollow, only: [:create]
    resources :followings, only: %i[index]
    resources :followers, only: %i[index]
  end

  resources :searches, only:[:index]
end
