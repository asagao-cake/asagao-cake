class Public::HomesController < ApplicationController
  def top
    # オススメ商品
    @recommended_items = Item.find(1,2,3,4)
    #ジャンル検索
    @genres = Genre.all
    if @genre = Genre.find_by(name: params[:name])
       @items = @genre.items.page(params[:page]).reverse_order
    else
       @items = Item.page(params[:page]).reverse_order
    end
  end

end
