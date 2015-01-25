class AddMovieIdToMovieThemes < ActiveRecord::Migration
  def change
    add_column :movie_themes, :movie_id, :integer
  end
end
