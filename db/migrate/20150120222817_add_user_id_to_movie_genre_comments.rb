class AddUserIdToMovieGenreComments < ActiveRecord::Migration
  def change
    add_column :movie_genre_comments, :user_id, :integer
  end
end
