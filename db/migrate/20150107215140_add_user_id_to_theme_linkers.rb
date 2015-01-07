class AddUserIdToThemeLinkers < ActiveRecord::Migration
  def change
    add_column :theme_linkers, :user_id, :integer
  end
end
