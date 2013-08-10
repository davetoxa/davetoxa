namespace :rvm do
  desc "Install RVM, Ruby"
  task :install, roles: :app do
    run "#{sudo} apt-get -y install curl git"
    run '\curl -L https://get.rvm.io | sudo bash -s stable --ruby'
    run "gem install bundler --no-ri --no-rdoc"
  end
  after "deploy:install", "rvm:install"
end