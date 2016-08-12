class AddAvatarToAlbumImages < ActiveRecord::Migration[5.0]
  def change
    add_column :album_images, :avatar, :string
  end
end
