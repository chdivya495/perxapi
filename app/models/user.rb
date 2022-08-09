class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :transactions, dependent: :destroy
  has_many :user_rewards, dependent: :destroy
  has_many :rewards, through: :user_rewards
  has_many :reward_histories, dependent: :destroy
  belongs_to :tier

  after_save :update_tier, if: :reward_points_changed?

  def country
    Country[country_code].iso_short_name
  end

  def current_tier
    tier.name
  end

  def update_tier
    user.reward_histories.where(created_at: (Time.now.beginning_of_year..Time.now))
  end
end
