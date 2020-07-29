Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
    resources :items, only: [:index, :new, :create, :show, :edit, :update] do
      resources :images, only: [:new, :create]
    end
  end