class Item < ApplicationRecord
  has_many :images
  belongs_to :category
  
  accepts_nested_attributes_for :images, allow_destroy: true
  [:name, :explanation, :quality, :delivery_cost, :region, :period, :price].each do |v|
    validates v, presence: true
  end

  validates :name, length: { maximum: 40 }
  
end
