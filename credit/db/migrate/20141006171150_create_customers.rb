class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :uuid
      t.decimal :credit_limit
      t.decimal :current_balance

      t.timestamps
    end
    add_index :customers, :uuid
  end
end
