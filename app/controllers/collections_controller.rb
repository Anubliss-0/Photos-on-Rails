class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @collections = Collection.all
  end

  def new
    @collection = Collection.new
    @bookmark = Bookmark.new
    authorize @collection
  end

  def create
    @collection = Collection.new(collection_params)
    authorize @collection
    if @collection.save!
      params[:collection][:photo_ids].delete("")
      params[:collection][:photo_ids].each do |photo|
        @bookmark = Bookmark.new(photo_id: photo.to_i, collection: @collection)
        @bookmark.save!
      end
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  def show
    @collection = Collection.find(params[:id])
    authorize @collection
    @bookmarks = Bookmark.all.select { |bookmark| bookmark.collection_id = @collection.id}
  end

  def edit
    @photos = Photo.all
    @collection = Collection.find(params[:id])
    authorize @collection
    @cover = []
    @collection.photos.each_with_index do |item, i|
      @cover << ["#{item.title}", "#{i}"]
    end
  end

  def update
    @collection = Collection.find(params[:id])
    @bookmarks = @collection.bookmarks
    authorize @collection
    if @collection.update(collection_params)
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    authorize @collection
    @collection.destroy
    flash[:notice] = "#{@collection.name} has been deleted."
    redirect_to collections_path, status: :see_other
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :description, :cover)
  end
end
