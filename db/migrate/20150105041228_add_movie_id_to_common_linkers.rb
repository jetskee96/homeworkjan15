class AddMovieIdToCommonLinkers < ActiveRecord::Migration
  def change
    add_column :common_linkers, :movie_id, :integer
  end
end
