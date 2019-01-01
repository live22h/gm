class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.date  :deadline
      t.belongs_to :theme, index: true
      t.text :description
      t.timestamps
    end
  end
end
