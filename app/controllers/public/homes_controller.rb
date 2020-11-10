class Public::HomesController < ApplicationController
  def top
    # オススメ商品
    @genres = Genre.where(is_valid: true)
    @recommended_items = Item.where(is_sale: true).where(genre_id: @genres).sample(4)
    #ジャンル検索
    @genres = Genre.where(is_valid: true)
    if @genre = Genre.find_by(name: params[:name])
       @items = @genre.items.page(params[:page]).reverse_order
    else
       @items = Item.page(params[:page]).reverse_order
    end
  end

end
