class AddReferenceToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :group, foreign_key: true, null: false, index: true
    add_reference :messages, :user, foreign_key: true, null: false, index: true
  end
end
