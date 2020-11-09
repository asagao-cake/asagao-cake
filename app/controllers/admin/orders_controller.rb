class Admin::OrdersController < ApplicationController

    def index #注文履歴一覧
        @orders = Order.all
        @pages = Order.all.page(params[:page]).per(10)
    end

    def show #注文履歴詳細
        @order = Order.find(params[:id])
        # @order_items = OrderItem.find(params[:id])
        @order_items = OrderItem.where(order_id: params[:id])
        # byebug
    end

    def update #注文ステータス・制作ステータス
        # 注文ステータス
        @order_status = Order.find(params[:id])
        @order_status.update(order_params)
        redirect_to admin_order_path(@order_status)
        # 制作ステータス
        @production_status = OrderItem.find(params[:id])
        @order_status.update(order_items_params)
        redirect_to admin_order_path(@order_status)
    end

    def new
      @order = Order.new
    end


end
