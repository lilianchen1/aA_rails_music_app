class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :band_id
      t.string :genre

      t.timestamps
    end

    add_index :albums, :band_id
  end
end
