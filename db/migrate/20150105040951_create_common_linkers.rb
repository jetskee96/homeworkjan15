class CreateCommonLinkers < ActiveRecord::Migration
  def change
    create_table :common_linkers do |t|
      t.text :cliche
      t.text :description

      t.timestamps
    end
  end
end
