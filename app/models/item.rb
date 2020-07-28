class Item < ApplicationRecord
  belongs_to :category
  has_many :images
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true

  [:name, :explanation, :quality, :delivery_cost, :period, :price, :prefecture].each do |v|
    validates v, presence: true
  end

  validates :name, length: { maximum: 40 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
