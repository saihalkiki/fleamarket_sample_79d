require 'rails_helper'

describe Item do
  describe '#create' do
    it "nameが空では登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "explanationが空では登録できないこと" do
      item = build(:item, explanation: "")
      item.valid?
      expect(item.errors[:explanation]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "qualityが空では登録できないこと" do
      item = build(:item, quality: "")
      item.valid?
      expect(item.errors[:quality]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "delivery_costが空では登録できないこと" do
      item = build(:item, delivery_cost: "")
      item.valid?
      expect(item.errors[:delivery_cost]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "prefecture_idが空では登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "periodが空では登録できないこと" do
      item = build(:item, period: "")
      item.valid?
      expect(item.errors[:period]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "priceが空では登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "nameが50文字以上であること" do
      item = build(:item, name: "ああああああああああああああああああああああああああああああああああああああああああああああああああああああ")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 50 characters)")
    end
  end

end
