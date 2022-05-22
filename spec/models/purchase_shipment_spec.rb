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
        expect(@purchase_shipment).to be_valid
      end
    end

    context '商品購入できない場合' do
      it "postal_codeにハイフンがない場合登録できない" do
        @purchase_shipment.postal_code = '1234567'
        @purchase_shipment.valid?
      end
    end
  end
end