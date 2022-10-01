class Photo < ApplicationRecord
  has_many :bookmarks
  has_many :collections, through: :bookmarks
end
