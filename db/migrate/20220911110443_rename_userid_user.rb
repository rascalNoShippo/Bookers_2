class RenameUseridUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :user_id, :user
  end
end
