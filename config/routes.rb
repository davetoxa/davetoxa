Davetoxa::Application.routes.draw do
  root 'posts#index'
  devise_for( :users,
    only: [:sessions, :registrations, :omniauth_callbacks],
    controllers: { omniauth_callbacks: "omniauth" }
  )

  resources :subscribes, except: [:edit, :show]
  resources :posts
  resources :users, only: :index
  resource :search, only: :show, controller: :search

  get '/admin',   to: 'main#admin'
end
