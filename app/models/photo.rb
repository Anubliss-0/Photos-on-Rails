class Photo < ApplicationRecord
  has_many :collections, through: :bookmarks
end
