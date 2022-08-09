class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.string :country_code
      t.decimal :amount
      t.string :status
      t.timestamps
    end
  end
end
