class RenameUserToUserid < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :user, :user_id
  end
end
