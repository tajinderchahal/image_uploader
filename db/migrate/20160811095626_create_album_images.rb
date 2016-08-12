class CreateAlbumImages < ActiveRecord::Migration[5.0]
  def change
    create_table :album_images do |t|
      t.references :album, foreign_key: true
      t.text :name

      t.timestamps
    end
  end
end
