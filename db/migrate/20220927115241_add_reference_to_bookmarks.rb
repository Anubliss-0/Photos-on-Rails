class AddReferenceToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookmarks, :collection, foreign_key: true
    add_reference :bookmarks, :photo, foreign_key: true
  end
end
