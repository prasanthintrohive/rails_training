namespace :charge do
  desc "TODO"
  task calculate: :environment do
    BookStatusJob.new.perform
    puts 'BookStatusJob :)'
    PriorStatusJob.new.perform
    puts 'PriorStatusJob :)'
  end

  task fine: :environment do
    FineStatusJob.new.perform
    puts 'FineStatusJob :)'
  end

end
