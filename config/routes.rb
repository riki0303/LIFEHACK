Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'homes#show'
  resources :posts
  resource :profile, only: [:show, :edit, :update]
  resources :accounts, only: [:show]
end
