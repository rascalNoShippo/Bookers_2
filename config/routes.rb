Rails.application.routes.draw do
  devise_for :users
  
  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "about" => "homes#about"
end
