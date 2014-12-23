set  :user,      "shime"
set  :branch,    'master'
set  :rails_env, 'production'
set  :log_level, "info"

role :app, %w{54.64.216.117}
role :web, %w{54.64.216.117}
role :db,  %w{54.64.216.117}

set :ssh_options, {
  user:          'shime',
  keys:          %w(~/.ssh/shime),
  forward_agent: true,
}

namespace :deploy do
  desc 'Start application'
  task :start do
    invoke 'unicorn:start'
  end

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  after :publishing, :restart

  desc 'Stop application'
  task :stop do
    invoke 'unicorn:stop'
  end
end
