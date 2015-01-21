class CreateMovieGenres < ActiveRecord::Migration
  def change
    create_table :movie_genres do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
