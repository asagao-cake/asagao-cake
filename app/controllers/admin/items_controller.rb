class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id), notice: "You have created book successfully."
    else
      @item = Item.new
      render 'new'
    end
  end

  def show
     @item = Item.find(params[:id])
     @genre = Genre.find(@item.genre_id)
  end

  def index
     @items = Item.all
  end


  private
  def item_params
    params.require(:item).permit(:image, :name, :genre_id, :description, :price, :is_sale )
  end
end
