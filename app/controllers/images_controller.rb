class ImagesController < ApplicationController
  #before_action :authenticate_user!
  def index
    @album_id = params[:id]
    @album_name = params[:name]
    @album_images = AlbumImage.select("id, name, avatar").\
                            where(:album_id => @album_id).\
                            order("created_at desc")
    render 'index'
  end
end
