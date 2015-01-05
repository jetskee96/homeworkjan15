class AddUserIdToCommonLinkers < ActiveRecord::Migration
  def change
    add_column :common_linkers, :user_id, :integer
  end
end
