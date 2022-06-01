require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipment = FactoryBot.build(:purchase_shipment, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it "building_name以外の情報が存在すれば登録できる" do
        @purchase_shipment.building_name = nil
        expect(@purchase_shipment).to be_valid
      end

      it "全ての項目が入力されていれば購入できる" do
      expect(@purchase_shipment).to be_valid
      end

    end

    context '商品購入できない場合' do
      it "tokenが空では登録できないこと" do
        @purchase_shipment.token = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空では購入できない" do
        @purchase_shipment.postal_code = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeにハイフンがない場合は購入できない" do
        @purchase_shipment.postal_code = '1234567'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "都道府県が未選択の場合は購入できない" do
        @purchase_shipment.prefecture_id = '0'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "市区町村が空の場合は購入できない" do
        @purchase_shipment.city = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空の場合は購入できない" do
        @purchase_shipment.address = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が空の場合は購入できない" do
        @purchase_shipment.phone_number = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号に数値以外の値が入っていると保存できない" do
        @purchase_shipment.phone_number = '090@234@678'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が9桁以下では購入できない" do
        @purchase_shipment.phone_number = '090-1234'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が12桁以上では購入できない" do
        @purchase_shipment.phone_number = '090-1234-567891023'
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Phone number is invalid")
      end

      it "userが紐づいていないと購入できない" do
        @purchase_shipment.user_id = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("User can't be blank")
      end

      it "itemが紐づいていないと購入できない" do
        @purchase_shipment.item_id = nil
        @purchase_shipment.valid?
        expect(@purchase_shipment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end