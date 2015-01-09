class AddMovieIdToLocationLinkers < ActiveRecord::Migration
  def change
    add_column :location_linkers, :movie_id, :integer
  end
end
