class CreateAddFilenameToAlbumimages < ActiveRecord::Migration[5.0]
  def change
    create_table :add_filename_to_albumimages do |t|
      t.text :filename

      t.timestamps
    end
  end
end
