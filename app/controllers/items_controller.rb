class ItemsController < ApplicationController
  # before_action :authenticate_user!
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private 
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_time_id, :user_id, :price)
  end

end
