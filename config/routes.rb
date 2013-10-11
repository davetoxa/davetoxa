Davetoxa::Application.routes.draw do

  root 'main#index'
  devise_for :users, only: [:sessions, :registrations, :omniauth_callbacks],
              controllers: {omniauth_callbacks: "omniauth"}

  resources :subscribes, except: [:edit, :show]
  resources :posts
  resource :search, only: :show, controller: :search

  get '/plan',   to: 'main#plan'

end
