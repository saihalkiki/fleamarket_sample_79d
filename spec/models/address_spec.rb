require 'rails_helper'

describe Address do
  describe '#create' do
    it "postal_code, prefecture_id, city, house_number, phone_numberが存在すれば登録できる" do
      address = build(:address)
      expect(address).to be_valid
    end
  end

# presence: trueになっているか。
  describe '#create' do
    it "postal_codeが空では登録できないこと" do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("が入力されていません。")
    end
  end

  describe '#create' do
    it "prefecture_idが空では登録できないこと" do
      address = build(:address, prefecture_id: "")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("が選択されていません。")
    end
  end

  describe '#create' do
    it "cityが空では登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("が入力されていません。")
    end
  end

  describe '#create' do
    it "house_numberが空では登録できないこと" do
      address = build(:address, house_number: "")
      address.valid?
      expect(address.errors[:house_number]).to include("が入力されていません。")
    end
  end

  describe '#create' do
    it "phone_numberが空では登録できないこと" do
      address = build(:address, phone_number: "")
      address.valid?
      expect(address.errors[:phone_number]).to include("が入力されていません。")
    end
  end

  describe '#create' do
    it "building_nameが空でも登録できること" do
      address = build(:address, building_name: "")
      expect(address).to be_valid
    end
  end

  # phone_numberがuniquennss: trueになっているか
  describe '#create' do
    it "同じphone_numberは登録できないこと" do
      address = create(:address)
      another_address = build(:address, phone_number: address.phone_number)
      another_address.valid?
      expect(another_address.errors[:phone_number]).to include("はハイフンなしで入力してください。")
    end
  end
end