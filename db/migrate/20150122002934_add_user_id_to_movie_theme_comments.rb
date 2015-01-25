class AddUserIdToMovieThemeComments < ActiveRecord::Migration
  def change
    add_column :movie_theme_comments, :user_id, :integer
  end
end
