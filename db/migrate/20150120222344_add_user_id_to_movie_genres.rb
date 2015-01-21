class AddUserIdToMovieGenres < ActiveRecord::Migration
  def change
    add_column :movie_genres, :user_id, :integer
  end
end
