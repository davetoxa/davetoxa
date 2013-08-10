Davetoxa::Application.routes.draw do

  root 'main#index'

  get '/help',   to: 'main#help'
  get '/plan',   to: 'main#plan'
  
end
