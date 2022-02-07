class RemoveTwitterFromBuddies < ActiveRecord::Migration[6.1]
  def change
    remove_column :buddies, :twitter, :string
  end
end
