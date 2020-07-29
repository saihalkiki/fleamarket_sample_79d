Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
    resources :items, only: [:index, :new, :create, :show] do
      resources :images, only: [:new, :create]
    end
  end
 