class AddMovieIdToGenreLinkers < ActiveRecord::Migration
  def change
    add_column :genre_linkers, :movie_id, :integer
  end
end
