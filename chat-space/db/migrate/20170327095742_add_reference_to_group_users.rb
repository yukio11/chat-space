class AddReferenceToGroupUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :group_users, :group, foreign_key: true, null: false, index: true
    add_reference :group_users, :user, foreign_key: true, null: false, index: true
  end
end
