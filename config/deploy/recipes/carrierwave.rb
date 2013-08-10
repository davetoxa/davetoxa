namespace :carrierwave do
  desc "Install image magick"
  task :install, roles: :web do
    run "#{sudo} apt-get -y install imagemagick"
  end
  after "deploy:install", "carrierwave:install"

  desc 'Share carrierwave folder'
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/uploads/ #{release_path}/public/uploads"
  end
  after "deploy:finalize_update", "carrierwave:symlink"
end