class Public::CartItemsController < ApplicationController

  def cart
    @cart_items = current_customer.cart_items
  end

  def create
    if @cart_item.blank?
      @cart_item = current_customer.cart_items.build(item_id: params[:item_id])
    end
    @cart_item.item_count += params[:item_count].to_i
    @cart_item.save
    redirect_to cart_item_path
  end




end
