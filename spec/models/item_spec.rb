require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品情報の保存' do
    context '商品情報の保存ができる場合' do
      it '必須情報全て入力すると保存ができる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報が保存できない場合' do
      it "商品画像が空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
