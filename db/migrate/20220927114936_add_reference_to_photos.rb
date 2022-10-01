class AddReferenceToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :photos, :collection, foreign_key: true
  end
end
