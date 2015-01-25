class CreateMovieThemeComments < ActiveRecord::Migration
  def change
    create_table :movie_theme_comments do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
