class UploadController < ApplicationController
  def index
    @albums = Album.find(:all, :order => "id desc", :limit => 5).reverse
  end

  before_action :authenticate_user!
  def new
    @currentUser = current_user.id
    @upload_image = ''
    @upload = ''
    @albums = Album.where(user_id: @currentUser)
    @album_id = params[:album_id]
    render 'new'
  end

  def create
    @image_limit = false
    # checking for old album id
    if params[:old_album] != ''
        @album_id = params[:old_album]
        if AlbumImage.where(:album_id => @album_id).count > 25
           @image_limit = true
        end
    elsif params[:new_album]
        # create new if new album
        new_album = Album.create(:name => params[:new_album],\
                     :user_id => current_user.id,\
                     :created_on => Time.now,\
                     :created_at => Time.now,\
                     :updated_at => Time.now)
        @album_id = new_album.id
    end

   # creating entry for new image in database
    @upload = AlbumImage.new(:name => params[:name],\
                             :filename => params[:filename],\
                             :album_id => @album_id,\
                             :avatar => params[:attachment])

    # validating data provided
    @albums = Album.where(user_id: current_user.id)
    @upload_image = ''
    if !@upload.valid?
        render 'new'
    else
        if @image_limit
          @upload.errors.add(:image_upload_limit, 'You cannot upload more than 25 images to an album')
          render 'new' and return true
        end
        @upload.save
        redirect_to action: "new", :album_id => @album_id
    end
  end
end
