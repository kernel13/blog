set :application, "blog"
set :repository,  "git@github.com:kernel13/blog.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :use_sudo, false
set :branch, "master"
set :deploy_via, :checkout

set :user, "root"
set :scm_passphrase, "ci0T@t13"
default_run_options[:pty] = true 

role :web, "67.208.112.172"                        
role :app, "67.208.112.172"                       
role :db,  "67.208.112.172" , :primary => true 

set :deploy_to, "/srv/www/lighttpd/#{application}"


#after "deploy", "deploy:bundle_gems"
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   
   task :bundle_gems do
     run "cd #{deploy_to}/current && bundle install vendor/gems"
   end
   
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end