require 'bundler/capistrano'

load 'config/deploy/recipes/base'
load 'config/deploy/recipes/rbenv'
load 'config/deploy/recipes/nginx'
load 'config/deploy/recipes/unicorn'
load 'config/deploy/recipes/monit'
load 'config/deploy/recipes/psql'
load 'config/deploy/recipes/rails'

server '198.211.121.183', :web, :app, :db, primary: true
set :domain, 'davetoxa.info'

set :user, 'deploy'
set (:deploy_to){ "/home/#{user}/#{application}/" }
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository,  'git@github.com:davetoxa/davetoxa.git'
set :application, 'davetoxa'

set :rails_env, 'production'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

#set :bundle_cmd, 'rvm use 2.0.0 do bundle'
set :bundle_cmd, '/home/deploy/.rbenv/shims/bundle'

namespace :deploy do
  desc 'Symlink all configs into current release'
  task :symlink_configs, roles: :app do
    s = "cd #{shared_path}/config && "
    s << "for i in `find . -type f | sed 's/^\\.\\///'` ; do "
    s << "echo \"create current/config/${i}\" ;"
    s << "rm -f #{release_path}/config/${i} ;"
    s << "ln -snf #{shared_path}/config/${i} #{release_path}/config/${i} ; done"
    run s
  end
  after 'deploy:finalize_update', 'deploy:symlink_configs'

end

after 'deploy', 'deploy:cleanup'