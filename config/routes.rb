Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :images, only: [:new, :create]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :cards, only: [:new, :show] 
end

 

