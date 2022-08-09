class AddTierIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :tier_id, :integer
  end
end
