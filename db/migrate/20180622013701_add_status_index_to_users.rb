class AddStatusIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :status
  end
end
