$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.8.7'        # Or whatever env you want it to run in.
set :rvm_type, :user

set :application, "flash_break"
set :repository,  "git@github.com:jamesyu/flash_break.git"
set :scm, :git
set :deploy_to, "/var/www/apps/flash_break"
set :user, "james"
set :port, 77

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "flashadsarebroken.com"
role :web, "flashadsarebroken.com"
role :db,  "flashadsarebroken.com", :primary => true


task :get_database_yml, :roles => :app do
  run "cp #{shared_path}/database.yml #{current_release}/config"
end

task :generate_assets, :roles => :app do
  run "cd #{current_release} && rake more:generate"
end

after 'deploy:update_code', :roles => :app do
  deploy.get_database_yml
  deploy.generate_assets
end

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "/etc/init.d/thin restart"
  end
end
