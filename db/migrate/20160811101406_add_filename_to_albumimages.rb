class AddFilenameToAlbumimages < ActiveRecord::Migration[5.0]
  def change
    add_column :album_images, :filename, :text
  end
end
