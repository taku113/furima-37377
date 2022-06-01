require 'rails_helper'

RSpec.describe Shipment, type: :model do
  before do
    @shipment = FactoryBot.build(:shipment)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it "building_name以外の情報が存在すれば登録できる" do
        expect(@shipment).to be_valid
      end
    end

    context '商品購入できない場合' do
      it "postal_codeにハイフンがない場合登録できない" do
        @shipment.postal_code = '1234567'
        @shipment.valid?
        binding.pry
      end
    end
  end
end
