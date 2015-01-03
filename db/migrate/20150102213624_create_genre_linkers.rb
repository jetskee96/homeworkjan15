class CreateGenreLinkers < ActiveRecord::Migration
  def change
    create_table :genre_linkers do |t|
      t.text :genre
      t.text :description

      t.timestamps
    end
  end
end
