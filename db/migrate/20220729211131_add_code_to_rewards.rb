class AddCodeToRewards < ActiveRecord::Migration[6.1]
  def change
    add_column :rewards, :code, :string
  end
end
