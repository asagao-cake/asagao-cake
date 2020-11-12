class Admin::OrderDetailsController < ApplicationController

    layout 'admin'

    def update
        # 制作ステータス
        @order_item = OrderItem.find(params[:id])
        @order_item.production_status = params[:order_item][:production_status]
        @order_item.update(order_item_params)
        @order_items = OrderItem.where(order_id: @order_item.order_id)
        if @order_item.production_status == "製作中"
            @order_item.order.update(status: "製作中")
        elsif @order_item.production_status == "製作完了"
            complete_status = @order_items.pluck(:production_status).grep("製作完了")
            if complete_status.size == @order_items.count
                @order_item.order.update(status: "発送準備中")
            end
        end
        redirect_to admin_order_path(@order_item.order)
    end

    private
    def order_item_params
        params.require(:order_item).permit(:production_status)
    end
end
