class Admin::OrderDetailsController < ApplicationController

    def update
        # 制作ステータス
        @order_item = OrderItem.find(params[:id])
        @order_item.production_status = params[:order_item][:production_status]
        @order_item.save
        redirect_to admin_order_path(@order_item.order)
    end

    private
    def order_item_params
        params.require(:order_item).permit(:production_status)
    end
end
