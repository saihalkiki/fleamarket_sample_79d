class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :sns_credentials
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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    user
  end

end
