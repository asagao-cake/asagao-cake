class Public::ItemsController < ApplicationController
    
    def index
        @genres = Genre.all
        @items = Item.all
    end
    
    def show
         @item = Item.find(params[:id])
         @genres = Genre.all
    end
    
end
