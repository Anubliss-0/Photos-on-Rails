class PhotosController < ApplicationController


  def new
    @photo = Photo.new
    @bookmark = Bookmark.new
    authorize @photo
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save!
      params[:photo][:collection_ids].delete("")
      params[:photo][:collection_ids].each do |collection|
        @bookmark = Bookmark.new(photo: @photo, collection_id: collection)
        raise
        @bookmark.save!
      end
      flash[:notice] = "Photo saved."
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :film, :camera)
  end

end
