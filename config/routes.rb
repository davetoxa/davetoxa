Davetoxa::Application.routes.draw do

  root 'main#index'
  devise_for :users, only: [:sessions, :registrations]
  resources :subscribes, except: [:edit, :show]
  resources :posts

  get '/plan',   to: 'main#plan'

end
