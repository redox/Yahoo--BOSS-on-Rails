set :application, "boss"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/redox/www_#{application}"
set :user, "redox"

set :ssh_options, { :forward_agent => true }

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :repository, "git@github.com:redox/Yahoo--BOSS-on-Rails.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1

role :app, "rednet.fr"
role :web, "rednet.fr"
role :db,  "rednet.fr", :primary => true

default_run_options[:pty] = true 
desc "Restart Passenger"
namespace :deploy do
  task :restart do
    run "touch #{release_path}/tmp/restart.txt"
  end
end
