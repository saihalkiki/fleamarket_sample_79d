class Item < ApplicationRecord
  belongs_to :category
  has_many :images

  [:name, :explanation, :quality, :delivery_cost, :region, :period, :price].each do |v|
    validates v, presence: true
  end

  validates :name, length: { maximum: 40 }
end
