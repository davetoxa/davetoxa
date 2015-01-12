ip = '178.62.254.62'

role :app, ["deploy@#{ip}"]
role :web, ["deploy@#{ip}"]
role :db,  ["deploy@#{ip}"]

server ip, user: 'deploy', roles: %w{web app db}

set :stage, 'production'
set :rails_env, 'production'
