class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :destroy]
  before_action :item_find, only: [:show, :edit, :update, :destroy, :move_to_index]
  before_action :move_to_index, only: [:edit ]
  

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def show
  
  end

  def edit
  
  end

  def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
  end


  private 
  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_time_id, :user_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
