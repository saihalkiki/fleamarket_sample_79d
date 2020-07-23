Rails.application.routes.draw do
  root 'items#show'
  resources :items, only: [:index, :new, :create, :show]
end
