require "bundler/capistrano"

set :application, "asagao"
set :rails_env, "production"

server "example.com", :web, :app, :db, primary: true

set :repository, "ssh://git@git.example.com/var/git/asegao.git"
set :scm, :git
set :branch, "master"
set :user, "asagao"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{rails_env}"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
