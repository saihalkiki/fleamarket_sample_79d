class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user, optional: true

  # 先頭が「0」＋「半角数字2から3桁」＋「-（ハイフン）」＋「半角数字1から4桁」＋「-（ハイフン）」＋「半角数字4桁」
  validates :phone_number, presence: true ,uniqueness: true,
            format: { with: /\A\0\d{2,3}-\d{1,4}-\d{4}\z/ }
  validates :postal_code, presence: true,
            # 郵便番号(ハイフンあり7桁)
            format: { with: /\A\d{3}-\d{4}\z/, message: "is must NOT contain any other characters than alphanumerics." }
  [:prefecture_id, :city, :house_number, :building_name].each do |v|
    validates v, presence: true
  end
end
