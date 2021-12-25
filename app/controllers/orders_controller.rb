class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @item = Item.find(params[:item_id])
    @order_shipping_address = OrderShippingAddress.new
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_params)
    if @order_shipping_address.valid?
      @order_shipping_address.save
      redirect_to item_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping_address).permit(:card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(item_id: item.id)
  end
end
