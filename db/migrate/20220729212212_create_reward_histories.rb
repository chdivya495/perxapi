class CreateRewardHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :reward_histories do |t|
      t.integer :user_id
      t.integer :points_credited 
      t.timestamps
    end
  end
end
