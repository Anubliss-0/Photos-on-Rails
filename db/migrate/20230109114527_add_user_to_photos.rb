class AddUserToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :photos, :user, foreign_key: true
  end
end
