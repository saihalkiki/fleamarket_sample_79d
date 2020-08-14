require 'rails_helper'

describe Item do
  describe 'createアクションの際' do
    it "nameが空では登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "explanationが空では登録できないこと" do
      item = build(:item, explanation: "")
      item.valid?
      expect(item.errors[:explanation]).to include("を入力してください")
    end

    it "qualityが空では登録できないこと" do
      item = build(:item, quality: "")
      item.valid?
      expect(item.errors[:quality]).to include("を入力してください")
    end

    it "delivery_costが空では登録できないこと" do
      item = build(:item, delivery_cost: "")
      item.valid?
      expect(item.errors[:delivery_cost]).to include("を入力してください")
    end

    it "prefecture_idが空では登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "periodが空では登録できないこと" do
      item = build(:item, period_id: "")
      item.valid?
      expect(item.errors[:period_id]).to include("を入力してください")
    end

    it "priceが空では登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "nameが50文字以上は登録できない" do
      item = build(:item, name: "ああああああああああああああああああああああああああああああああああああああああああああああああああああああ")
      item.valid?
      expect(item.errors[:name]).to include("は50文字以内で入力してください")
    end

    it "prefecture_idが空では登録できないこと" do
      item = build(:item, prefecture_id:"")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "priceが¥50以下のときは登録できない" do
      item = build(:item, price: "40")
      item.valid?
      expect(item.errors[:price]).to include("は50以上の値にしてください")
    end

    it "priceが¥1,000,000以上のときは登録できない" do
      item = build(:item, price: "1500000")
      item.valid?
      expect(item.errors[:price]).to include("は1000000より小さい値にしてください")
    end
  end

end
