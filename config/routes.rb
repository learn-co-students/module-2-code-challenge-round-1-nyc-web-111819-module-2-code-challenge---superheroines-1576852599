Rails.application.routes.draw do
  resources :powers, only: [:index, :show, :new, :create, :edit, :update]
  # Can also be written as:
  # resources :powers, except: [:delete]
  resources :heroines  
end
