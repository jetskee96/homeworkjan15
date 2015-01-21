class CreateMovieGenreComments < ActiveRecord::Migration
  def change
    create_table :movie_genre_comments do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
