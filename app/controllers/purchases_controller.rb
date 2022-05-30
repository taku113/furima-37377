class PurchasesController < ApplicationController

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase_shipment = PurchaseShipment.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipment = PurchaseShipment.new(purchase_params)
    if @purchase_shipment.valid?
      @purchase_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end

    private

    def purchase_params
      params.require(:purchase_shipment).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end
