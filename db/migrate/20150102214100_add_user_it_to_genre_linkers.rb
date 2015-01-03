class AddUserItToGenreLinkers < ActiveRecord::Migration
  def change
    add_column :genre_linkers, :user_id, :integer
  end
end
