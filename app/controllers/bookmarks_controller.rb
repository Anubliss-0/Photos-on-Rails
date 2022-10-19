class BookmarksController < ApplicationController
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @photo = @bookmark.photo
    @bookmark.destroy
    redirect_back(fallback_location: "/")
  end
end
