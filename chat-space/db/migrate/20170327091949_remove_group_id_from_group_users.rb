class RemoveGroupIdFromGroupUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :group_users, :group_id, :int
    remove_column :group_users, :user_id, :int
  end
end
