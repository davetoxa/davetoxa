role :app, %w{deploy@178.62.254.62}
role :web, %w{deploy@178.62.254.62}
role :db,  %w{deploy@178.62.254.62}

server '178.62.254.62', user: 'deploy', roles: %w{web app db}

set :stage, 'production'
set :rails_env, 'production'
