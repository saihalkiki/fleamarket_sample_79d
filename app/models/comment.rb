class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :text, length: { maximum: 200 }
end
