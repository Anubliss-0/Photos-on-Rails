class BookmarksController < ApplicationController
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @photo = @bookmark.photo
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream
    end
  end

  def create(photo, collection)
    @bookmark = Bookmark.new(photo_id: photo, collection_id: collection)
    @bookmark.save!
  end
  helper_method :create
end
