class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @collections = Collection.all
    @photos = Photo.all
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
      redirect_to edit_collection_path(@collection)
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
    # @cover = []
    # @collection.photos.each_with_index do |item, i|
    #   @cover << ["#{item.title}", "#{i}"]
    # end
  end

  def set_cover
    @photos = Photo.all
    request.variant = :turbo_stream
    @collection = Collection.find(params[:collection_id])
    @collection.cover = params[:photo_id]
    @collection.save!


     respond_to do |format|
      format.html
      format.turbo_stream
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
