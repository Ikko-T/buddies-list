class AddAgeToBuddies < ActiveRecord::Migration[6.1]
  def change
    add_column :buddies, :age, :integer
  end
end
