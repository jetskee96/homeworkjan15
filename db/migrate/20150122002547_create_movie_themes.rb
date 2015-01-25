class CreateMovieThemes < ActiveRecord::Migration
  def change
    create_table :movie_themes do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
