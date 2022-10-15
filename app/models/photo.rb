class Photo < ApplicationRecord
  has_many :bookmarks
  has_many :collections, through: :bookmarks
  has_one_attached :photo
end
