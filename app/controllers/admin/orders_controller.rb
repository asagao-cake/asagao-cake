class Admin::OrdersController < ApplicationController

    def index #注文履歴一覧
        @orders = Order.all

    end

    def show #注文履歴詳細
        @order = Order.find(params[:id])
    end

    def update #注文ステータス・制作ステータス

    end

    def new
      @order = Order.new
    end

end
