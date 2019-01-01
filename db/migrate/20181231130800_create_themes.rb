class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :theme, null: false, default: ""
      t.belongs_to :theme, index: true
      t.timestamps
    end
  end
end
