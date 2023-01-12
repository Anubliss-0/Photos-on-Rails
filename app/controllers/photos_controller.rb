class PhotosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @photos = Photo.all
    @collections = Collection.all
  end

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

  def destroy
    @photo = Photo.find(params[:id])
    authorize @photo
    @photo.destroy
    flash[:notice] = "Photo deleted."
    redirect_to photos_path, status: :see_other
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
        if !@photo.bookmarks.any? { |bookmark| bookmark.photo_id == @bookmark.photo_id && bookmark.collection_id == @bookmark.collection_id }
        @bookmark.save!
        end
      end
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :film, :camera, :photo)
  end

end
