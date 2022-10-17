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
        @bookmark.save!
      end
      flash[:notice] = "Photo saved."
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    authorize @photo
  end

  def edit
    @photo = Photo.find(params[:id])
    authorize @photo
  end

  def update
    @photo = Photo.find(params[:id])
    authorize @photo
    if @photo.save!
      params[:photo][:collection_ids].delete("")
      params[:photo][:collection_ids].each do |collection|
        @bookmark = Bookmark.new(photo: @photo, collection_id: collection)
        @bookmark.save!
        redirect_to photo_path(@photo)
      end
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :film, :camera, :photo)
  end

end
