class Public::ItemsController < ApplicationController

    
    
    def index
        #ジャンル検索
        @genres = Genre.all
        if @genre = Genre.find_by(name: params[:name])
           @items = @genre.items.where().page(params[:page]).reverse_order
        else
	         @items = Item.page(params[:page]).reverse_order
        end
        #ページネーション
        @pages = @items.all.page(params[:page])
    end

    def show
        @item = Item.find(params[:id])
        @genres = Genre.all
        # @cart_item = CartItem.find_by(item_id: params[:id],customer_id: current_customer.id)
    end

end
