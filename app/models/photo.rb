class Photo < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :collections, through: :bookmarks
  has_one_attached :photo
  belongs_to :user
end
