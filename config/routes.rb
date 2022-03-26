Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index] 
  end 
end 