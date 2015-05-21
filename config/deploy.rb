lock '3.2.1'

set :application, 'susecon14'
set :repo_url, 'https://github.com/kalabiyau/SUSECon14.git'
set :deploy_to, '/home/devops/apps'
set :linked_dirs, %w{ tmp/pids tmp/sockets log }
set :log_level, :info

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute "cd #{release_path} && bundle exec thin -C config/thin.yml stop"
      execute "cd #{release_path} && bundle exec thin -C config/thin.yml start"
    end
  end

  after :publishing, :restart

end
