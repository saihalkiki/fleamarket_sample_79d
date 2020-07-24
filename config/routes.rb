Rails.application.routes.draw do
  root 'items#index'
    resources :items, only: [:index, :new, :create, :show] do
      resources :images, only: [:new, :create]
    end
  end
 