class CreateThemeLinkers < ActiveRecord::Migration
  def change
    create_table :theme_linkers do |t|
      t.text :theme
      t.text :description

      t.timestamps
    end
  end
end
