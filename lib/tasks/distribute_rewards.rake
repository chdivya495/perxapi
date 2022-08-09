namespace :distribute_rewards do
  task birthday_rewards: :environment do
    BirthdayRewardService.call
  end
end