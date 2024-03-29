Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:show, :index] do
    resources :posts, only: [:index, :new, :show, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end 
end 