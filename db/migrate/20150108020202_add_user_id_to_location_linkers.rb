class AddUserIdToLocationLinkers < ActiveRecord::Migration
  def change
    add_column :location_linkers, :user_id, :integer
  end
end
