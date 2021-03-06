Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#home'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :users, only: [:show, :create, :edit, :update, :destroy, :new] do 
    resources :user_factions 
  end
  resources :factions, only: [:show, :index]
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get "/signup", to: 'users#new'
  get "/logout", to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:show, :create, :edit, :update, :destroy, :index]
    resources :factions
    resources :user_factions
    get '/login' => 'sessions#new'
    post 'login' => 'sessions#create'
    get "/signup", to: 'users#new'
  end
end
