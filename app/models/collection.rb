class Collection < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :photos, through: :bookmarks
end
