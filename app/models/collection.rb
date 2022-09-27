class Collection < ApplicationRecord
  has_many :photos, through: :bookmarks
end
