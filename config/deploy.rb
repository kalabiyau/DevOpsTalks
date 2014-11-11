lock '3.2.1'

set :application, 'susecon14'
set :repo_url, 'https://github.com/kalabiyau/SUSECon14.git'
set :deploy_to, '/home/susecon14/apps'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute 'bundle exec ruby ', release_path.join('app/index.rb')
      execute "cd #{release_path} && bundle exec ruby #{release_path.join('app/index.rb')} &"
    end
  end

  after :publishing, :restart

end
