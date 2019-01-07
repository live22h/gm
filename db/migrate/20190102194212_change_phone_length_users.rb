class ChangePhoneLengthUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone, :string, :limit => 15
  end
end
