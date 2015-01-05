class AddMovieIdToThemeLinkers < ActiveRecord::Migration
  def change
    add_column :theme_linkers, :movie_id, :integer
  end
end
