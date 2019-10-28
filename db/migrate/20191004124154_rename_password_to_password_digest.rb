class RenamePasswordToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :usrs, :password, :password_digest
  end
end
