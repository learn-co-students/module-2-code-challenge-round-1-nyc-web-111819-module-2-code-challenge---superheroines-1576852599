Rails.application.routes.draw do
  resources :powers, only: [:index, :show, :create, :new]
  resources :heroines, only: [:index, :show, :create, :new]  
end
