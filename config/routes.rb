Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :create, :new, :show]  
  get '/search', :to => 'heroines#index'
end
