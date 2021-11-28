class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :price, :item_shipping_fee_status_id, :prefecture_id, :item_scheduled_delivery_id).merge(user_id: current_user.id)
  end
end
