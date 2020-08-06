require 'rails_helper'

describe User do
  #presence: trueになっているか
  describe '#create' do
    it "emailが空では登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "last_nameが空では登録できないこと" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "first_nameが空では登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "last_name_readが空では登録できないこと" do
      user = build(:user, last_name_read: "")
      user.valid?
      expect(user.errors[:last_name_read]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "first_name_readが空では登録できないこと" do
      user = build(:user, first_name_read: "")
      user.valid?
      expect(user.errors[:first_name_read]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "genderが空では登録できないこと" do
      user = build(:user, gender: "")
      user.valid?
      expect(user.errors[:gender]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "birthdayが空では登録できないこと" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "passwordが空では登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "password_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  # nicknameがuniquennss: trueになっているか
  describe '#create' do
    it "同じnicknameは登録できないこと" do
      user = create(:user)
      another_user = build(:user, nickname: user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("has already been taken")
    end
  end

end
