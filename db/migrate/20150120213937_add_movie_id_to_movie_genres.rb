class AddMovieIdToMovieGenres < ActiveRecord::Migration
  def change
    add_column :movie_genres, :movie_id, :integer
  end
end
