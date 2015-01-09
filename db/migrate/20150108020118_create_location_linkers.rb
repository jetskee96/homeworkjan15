class CreateLocationLinkers < ActiveRecord::Migration
  def change
    create_table :location_linkers do |t|
      t.text :location
      t.text :description

      t.timestamps
    end
  end
end
