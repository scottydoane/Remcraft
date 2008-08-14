set :application, "remcraft"
set :repository,  "git@scorpio.randomproductions.net:remcraft.git"

set :user, "randompr"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"
set :deploy_to, "/home/randompr/rails/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm, :git
set :scm_user, 'randompr'

role :app, "scorpio.randomproductions.net"
role :web, "scorpio.randomproductions.net"
role :db,  "scorpio.randomproductions.net", :primary => true

namespace :deploy do  
  task :restart do
    sudo 'killall lighttpd; sudo lighttpd -f /etc/lighttpd/lighttpd.conf'
  end
end