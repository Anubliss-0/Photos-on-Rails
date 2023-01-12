class AddUserToCollection < ActiveRecord::Migration[7.0]
  def change
    add_reference :collections, :user, foreign_key: true
  end
end
