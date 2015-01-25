class AddMovieThemeIdToMovieThemeComments < ActiveRecord::Migration
  def change
    add_column :movie_theme_comments, :movie_theme_id, :integer
  end
end
