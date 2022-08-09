class Transaction < ApplicationRecord
  belongs_to :user
  after_create :check_for_rewards

  def is_foreign?
    user.country_code != country_code
  end

  def check_for_rewards
    credit_reward_points_to_user if amount >= 100
    give_monthly_reward if eligible_for_monthly_reward?
    five_percent_cash_rebate if eligible_for_cash_rebate?
    free_movie_ticket_reward if eligible_for_movie_reward?
  end
  
  private

  def credit_reward_points_to_user
    standard_points = (amount.to_i/100)
    points = is_foreign? ? (standard_points * 2) : standard_points
    if user.update(reward_points: user.reward_points + points)
      user.reward_histories.create(points_credited: points)
    end
  end

  def give_monthly_reward
    reward = Reward.find_by(code: "FREECOFFEE")
    user.rewards << reward.id
  end

  def eligible_for_monthly_reward?
    points_earned_this_month = user.reward_histories.select(:points_credited).where(created_at: (Time.now.beginning_of_month..Time.now)).sum(:points_credited)
    points_earned_this_month >= 100
  end

  def eligible_for_cash_rebate?
    transactions_count = user.transactions.where("amount >= ? AND created_at BETWEEN ? AND ?", 100, Time.now.beginning_of_month, Time.now).count
    transactions_count >= 10
  end

  def eligible_for_movie_reward?
    first_transaction_date = user.transactions.first.created_at
    return false if (first_transaction_date + 60.days) < Time.now
    retur false if user.rewards.find_by(code: "FREEMOVIE")
    within_60_days = (first_transaction_date..(first_transaction_date + 60.days))
    total_amount = user.transactions.where(created_at: within_60_days).sum(:amount)
    total_amount >= 1000
  end

  def five_percent_cash_rebate
    reward = Reward.find_by(code: "5PERCENTCASH")
    user.rewards << reward.id
  end

  def free_movie_ticket_reward
    reward = Reward.find_by(code: "FREEMOVIE")
    user.rewards << reward.id
  end
end
