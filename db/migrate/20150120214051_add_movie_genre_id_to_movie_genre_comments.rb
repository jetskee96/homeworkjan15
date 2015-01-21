class AddMovieGenreIdToMovieGenreComments < ActiveRecord::Migration
  def change
    add_column :movie_genre_comments, :movie_genre_id, :integer
  end
end
