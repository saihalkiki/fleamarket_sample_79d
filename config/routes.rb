Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update] do
    resources :images, only: [:new, :create]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
 