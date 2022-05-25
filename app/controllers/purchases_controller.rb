class PurchasesController < ApplicationController

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase_shipment = PurchaseShipment.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
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

end
