Davetoxa::Application.routes.draw do

  root 'main#index'
  devise_for :users, only: [:sessions, :registrations]
  resource :subscribes, only: [:new, :create, :destroy, :show]

  get '/help',   to: 'main#help'
  get '/plan',   to: 'main#plan'

end
