class AddIndexToMessage < ActiveRecord::Migration[5.0]
  def change
    add_index :messages, :body, :length => 140
  end
end
