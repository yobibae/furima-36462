class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      @order_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
