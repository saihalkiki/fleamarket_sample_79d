class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :period

  belongs_to :category
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  accepts_nested_attributes_for :images, allow_destroy: true

  [:name, :explanation, :quality, :delivery_cost, :prefecture_id, :period_id, :price, :user_id].each do |v|
    validates v, presence: true
  end
  validates :name, length: { maximum: 50 }

  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
