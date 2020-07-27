class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  enum gender: { 男性: 0, 女性: 1}
  validates :password, length: { minimum: 7 }
  validates :nickname, presence: true, uniqueness: true

  [:nickname, :last_name, :first_name, :last_name_read, :first_name_read,:gender, :birthday, :email ,:password].each do |v|
    validates v, presence: true
  end
end
