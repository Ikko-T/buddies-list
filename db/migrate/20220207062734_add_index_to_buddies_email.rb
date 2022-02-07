class AddIndexToBuddiesEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :buddies, :email, unique: true
  end
end
