Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
    resources :items do
      resources :images, only: [:new, :create]
    end
    resources :users, only: :show
  end
 