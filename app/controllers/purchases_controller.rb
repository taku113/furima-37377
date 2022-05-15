class PurchasesController < ApplicationController

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase_shipment = PurchaseShipment.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @purchase_shipment = PurchaseShipment.new(purchase_params)
    if @purchase_shipment.valid?
      @purchase_shipment.save
      redirect_to root_path
    else
      reder :new
    end
  end

    private

    def purchase_params
      params.require(:purchase_shipment).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
    end

end
