class CreateSpecialists < ActiveRecord::Migration[5.2]
  def change
    create_table :specialists do |t|
      t.boolean :accepted, default: false
      t.belongs_to :order, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
