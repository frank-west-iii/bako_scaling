class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :uuid

      t.timestamps
    end
    add_index :customers, :uuid
  end
end
