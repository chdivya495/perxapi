set :output, "log/cron.log"
every 2.minutes do
  rake "distribute_rewards:birthday_rewards"
end

