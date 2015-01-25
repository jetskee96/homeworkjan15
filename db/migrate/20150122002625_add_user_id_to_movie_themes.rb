class AddUserIdToMovieThemes < ActiveRecord::Migration
  def change
    add_column :movie_themes, :user_id, :integer
  end
end
