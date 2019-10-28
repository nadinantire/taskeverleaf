class AddRoleToUsrs < ActiveRecord::Migration[5.2]
  def change
    add_column :usrs, :role, :string
  end
end
