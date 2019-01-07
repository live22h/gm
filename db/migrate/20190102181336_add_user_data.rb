class AddUserData < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, :limit => 25
    add_column :users, :fam, :string, :limit => 25
    add_column :users, :phone, :string, :limit => 11
  end
end
