worker_processes 1
timeout 180
preload_app true

listen "/home/shime/cityscape/shared/tmp/sockets/unicorn.sock"
pid    "/home/shime/cityscape/shared/tmp/pids/unicorn.pid"

LOG_DIR = '/home/shime/cityscape/shared/log/'
stderr_path LOG_DIR + "unicorn.stderr.log"
stdout_path LOG_DIR + "unicorn.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  # if ['production', 'preview'].index(ENV['RAILS_ENV'])
  #   GC.disable
  # end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
