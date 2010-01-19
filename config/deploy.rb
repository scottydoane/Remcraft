set :application, "remcraft"
set :repository, "git://github.com/scottydoane/Remcraft.git"
default_run_options[:pty] = true

# PRODUCTION VALUES
set :user, "remcraft" 
set :runner, user
set :password, "9b2d6v1s"

#set :user, "root"
#set :password, "pr0d1G10u$"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

set :deploy_to, "/home/remcraft/etc/rails_apps/remcraft_2010"
# set :deploy_to, "/var/www/rails/#{application}"

set :rails_env, "production"
set :use_sudo, false

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm, :git
set :scm_user, 'scotty'
# set :git_enable_submodules, true

set :port, 7822

role :app, "www.remcraft.com"
role :web, "www.remcraft.com"
role :db,  "www.remcraft.com", :primary => true

namespace :deploy do  
  # task :restart do
  #  run "/etc/init.d/lighttpd restart </dev/null >/dev/null 2>&1 " 
  # end
  
  task :after_symlink do
    # sudo 'sudo chown -R www-data:www-data /var/www/rails/remcraft/releases'
    # sudo 'sudo chmod 777 /var/www/rails/remcraft/current/tmp'
    # sudo 'sudo ln -s /var/www/rails/remcraft/uploads /var/www/rails/remcraft/current/public/images/uploads'
    # sudo 'sudo ln -s /var/www/rails/remcraft/assets /var/www/rails/remcraft/current/public/assets'
    run "rm -rf #{deploy_to}/current/vendor/plugins"
    run "ln -s #{deploy_to}/plugins #{deploy_to}/current/vendor/plugins"
    run "ln -s #{deploy_to}/uploads #{deploy_to}/current/public/images/uploads"
    run "ln -s #{deploy_to}/assets #{deploy_to}/current/public/assets"
    # run "ln -s #{deploy_to}/shared/images #{deploy_to}/current/public/images/static"
  end
  
  desc "Restart the app server"
  task :restart, :roles => :app do
    send(run_method, "")
    #send(run_method, "cd #{current_path} && mongrel_rails restart")
  end

  desc "Stop the app server"
  task :stop_app, :roles => :app do
    send(run_method, "")
    #send(run_method, "cd #{current_path} && mongrel_rails stop")
  end
  
  desc "Start the app server"
  task :start_app, :roles => :app do
    send(run_method, "")
    #send(run_method, "cd #{current_path} && mongrel_rails start -d -p #{app_port} -e #{app_env} < /dev/null >& /dev/null")
  end
end