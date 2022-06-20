# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron.log"
set :environment, "development"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
# every 1.minute do
#   Delayed::Job.enqueue(BookStstusJob.new).perform
# end
# every 1.minute do
#   rake 'charge:calculate'
# end

every 24.hours do
  rake 'charge:calculate'
end

every 25.hours do
  rake 'charge:fine'
end


# Learn more: http://github.com/javan/whenever
