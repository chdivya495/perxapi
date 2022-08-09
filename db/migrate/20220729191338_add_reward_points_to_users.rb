class AddRewardPointsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reward_points, :integer
  end
end
