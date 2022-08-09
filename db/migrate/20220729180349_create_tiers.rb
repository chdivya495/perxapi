class CreateTiers < ActiveRecord::Migration[6.1]
  def change
    create_table :tiers do |t|
      t.string :name, default: "Standard"
      t.integer :threshold, default: 0
      t.timestamps
    end
  end
end
