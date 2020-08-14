class Item < ApplicationRecord

  belongs_to :category
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  accepts_nested_attributes_for :images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :period

  enum delivery_cost:{"送料込み（出品者負担）": 1, "着払い（購入者負担）": 2}

  [:name, :explanation, :quality, :delivery_cost, :prefecture_id, :period_id, :price, :user_id, :images, :category_id].each do |v|
    validates v, presence: true
  end
  validates :name, length: { maximum: 50 }
  validates :price, :numericality => { greater_than_or_equal_to: 50, less_than: 1000000 }
 
  def self.search(search)
    if search
      Item.where('name LIKE(?)', "%#{search}%").order("created_at DESC")
    else
      Item.all.order("created_at DESC")
    end
  end
end
