set :application, "remcraft"
set :repository, "ssh://root@sagittarius.geekbehindthecurtain.com/home/git/repositories/remcraft.git"
default_run_options[:pty] = true

set :user, "root" 
set :runner, user

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"
set :deploy_to, "/var/www/rails/#{application}"
set :rails_env, "staging"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm, :git
set :scm_user, 'scotty'
set :git_enable_submodules, true

set :port, 7822

role :app, "sagittarius.geekbehindthecurtain.com"
role :web, "sagittarius.geekbehindthecurtain.com"
role :db,  "sagittarius.geekbehindthecurtain.com", :primary => true

namespace :deploy do  
  task :restart do
    run '/etc/init.d/lighttpd restart'
  end
end