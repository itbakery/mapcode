# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'mrtaline'
#set :repo_url, 'git@github.com:itbakery/mrtaline.git'
set :repo_url, 'git@github.com:itbakery/mapcode.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'
set :deploy_to, '/home/admin/apps/mrtaline'

# Default value for :scm is :git
# set :scm, :git
set :scm, :git
set :branch, 'master'
# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}
set :linked_files, %w{config/mongoid.yml db/seeds.rb config/boot.rb}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, {path: "/home/admin/.rbenv/bin:$PATH"}
# Default value for keep_releases is 5
set :keep_releases, 5
set :rbenv_ruby, '2.1.3'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end

end

namespace :nginx do
  desc 'restart nginx'
  task :restart do
    on roles(:app) do
      execute :sudo, "service nginx restart"
    end
  end
end

after 'deploy:restart', 'nginx:restart'
