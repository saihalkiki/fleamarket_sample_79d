Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
    resources :items, only: [:index, :new, :create, :show] do
      resources :images, only: [:new, :create]
    end
<<<<<<< HEAD
  resources :users, only: :show
  resources :cards, only: [:new, :show] 
end
=======
  end
 
>>>>>>> b64774ce04849aeacf78c797067ead631ca10d4c
