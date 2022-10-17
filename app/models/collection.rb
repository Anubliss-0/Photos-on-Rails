class Collection < ApplicationRecord
  has_many :bookmarks
  has_many :photos, through: :bookmarks
end
