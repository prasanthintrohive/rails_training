namespace :sample do
  desc 'saying hi to cron'
    task :test => [ :environment ] do
       puts 'hi cron :)'
    end
end

namespace :fruits do 
  desc "Print reminder about eating more fruit."
  task :apple do
    puts "Eat more apples!"
  end
end