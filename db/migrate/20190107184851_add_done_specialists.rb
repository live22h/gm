class AddDoneSpecialists < ActiveRecord::Migration[5.2]
  def change
    add_column :specialists, :done, :boolean, :default => false
  end
end
