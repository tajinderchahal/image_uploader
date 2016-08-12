class AlbumController < ApplicationController
  before_action :authenticate_user!
  def index
    @albums = Album.select("name, id").where(:user_id => current_user.id).order("created_at desc")
    render 'index'
  end
end
