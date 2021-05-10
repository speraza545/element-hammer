Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'
  resources :users, only: [:show, :create, :edit, :update, :destroy]
  resources :factions, only: [:show, :index]
  resources :user_factions
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get "/signup", to: 'users#new'
  get "/logout", to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:show, :create, :edit, :update, :destroy]
    resources :factions
    resources :user_factions
    get '/login' => 'sessions#new'
    post 'login' => 'sessions#create'
    get "/signup", to: 'users#new'
  end
end
