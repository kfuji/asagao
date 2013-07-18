require "bundler/capistrano"

set :application, "asagao"
set :rails_env, "production"

server "example.com", :web, :app, :db, primary: true

set :repository, "https://github.com/kfuji/asagao"
set :scm, :git
set :branch, "master"
set :user, "asagao"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{rails_env}"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

namespace :deploy do
  desc "Restarts your application."
  task :restart do
    run "mkdir -p #{shared_path}/tmp"
    run "touch #{shared_path}/tmp/restart.txt"
  end
end

after "deploy:update", roles: :app do
  run "/bin/cp #{shared_path}/config/database.yml #{release_path}/config/"
end
