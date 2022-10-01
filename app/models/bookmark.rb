class Bookmark < ApplicationRecord
  belongs_to :photo
  belongs_to :album
end
