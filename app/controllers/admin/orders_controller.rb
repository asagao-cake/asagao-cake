class Admin::OrdersController < ApplicationController

    def index #注文履歴一覧
        @orders = Order.all
        @pages = Order.all.page(params[:page]).per(10)
    end

    def show #注文履歴詳細
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order_id: params[:id])
        @total_fee = (@order.billing_amount - @order.shipping_fee).to_s(:delimited)
    end

    def update #注文ステータス
        @order = Order.find(params[:id])
        @order.update(order_params)
         if @order.status == "入金確認"
            @order.order_items.update(production_status: "製作待ち")
         end
         redirect_to admin_order_path(params[:id])
    end

    def new
      @order = Order.new
    end

    private

    def order_params
        params.require(:order).permit(:status)
    end
end
