class AddCoverToCollections < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :cover, :integer
  end
end
