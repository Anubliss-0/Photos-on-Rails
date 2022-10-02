class CollectionsController < ApplicationController
  def new
    @collection = Collection.new
    @bookmark = Bookmark.new
    authorize @collection
  end

  def create
    @collection = Collection.new(collection_params)
    authorize @collection
    if @collection.save
      @bookmark = Bookmark.new()
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :description)
  end
end
