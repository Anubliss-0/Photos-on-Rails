class Collection < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :photos, through: :bookmarks
  belongs_to :user
end
