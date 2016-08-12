class HomeController < ApplicationController
  def index
    @album_images = AlbumImage.select("id, name, avatar, album_id").\
                            order("created_at desc").limit(25)
    render 'index'
  end
end
