class AlbumImage < ApplicationRecord
  belongs_to :album
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true
  validates :album_id, presence: true
end
