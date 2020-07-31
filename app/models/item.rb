class Item < ApplicationRecord
  has_many :images
  belongs_to :category
  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :images, allow_destroy: true

  [:name, :explanation, :quality, :delivery_cost, :prefecture, :period, :price, :user_id].each do |v|
    validates v, presence: true
  end

  validates :name, length: { maximum: 40 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
