class RemoveColumnsFromMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :group_id, :int
    remove_column :messages, :user_id, :int
  end
end
