class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_one :address
  has_many :comments
  has_one :card, dependent: :destroy

  enum gender: { 男性: 0, 女性: 1}
  validates :password, length: { minimum: 7 }
  validates :nickname, presence: true, uniqueness: true
  # 全角ひらがな、全角カタカナ、漢字
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  [:last_name, :first_name].each do |v|
    validates v, format: { with: VALID_NAME_REGEX }
  end
  #　全角ひらがな
  VALID_NAME_READ_REGEX = /\A[ぁ-んー－]+\z/
  [:last_name_read, :first_name_read].each do |v|
    validates v, format: { with: VALID_NAME_READ_REGEX }
  end

  [:nickname, :last_name, :first_name, :last_name_read, :first_name_read,:gender, :birthday, :email ,:password].each do |v|
    validates v, presence: true
  end
end
