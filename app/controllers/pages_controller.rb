class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @collections = Collection.all
    @photos = Photo.all
    @cover_photo = @photos.sample
  end

  def about
  end

end
