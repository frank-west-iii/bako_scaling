class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :item, index: true
      t.string :status, default: 'pending_approval'

      t.timestamps
    end
  end
end
