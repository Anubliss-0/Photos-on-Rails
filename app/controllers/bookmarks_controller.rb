class BookmarksController < ApplicationController
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @photo = @bookmark.photo
    @bookmark.destroy
  end

  def create(photo, collection)
    @bookmark = Bookmark.new(photo_id: photo, collection_id: collection)
    @bookmark.save!
  end
  helper_method :create
end
