class AddOrderPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :picture, :string, :limit => 255
  end
end
