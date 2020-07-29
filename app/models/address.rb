class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user, optional: true

  validates :phone_number, uniqueness: true

  [:postal_code, :prefectures, :city, :house_number, :building_name, :phone_number, :user_id].each do |v|
    validates v, presence: true
  end
end
