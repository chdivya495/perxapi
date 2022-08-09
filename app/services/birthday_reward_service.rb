class BirthdayRewardService
  def self.call
    reward = Reward.find_by(code: "FREECOFFEE")
    User.where(dob: Date.today).each do |user|
      user.user_rewards.create(reward_id: reward.id)
    end
  end
end