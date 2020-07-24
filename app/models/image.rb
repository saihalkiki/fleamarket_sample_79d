class Image < ApplicationRecord
  belongs_to :item
  validates :image, presence: true
end
