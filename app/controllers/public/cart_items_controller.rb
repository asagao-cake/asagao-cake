class Public::CartItemsController < ApplicationController

  def cart
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = 0
    @cart_items.each do |cart_item|
      tax_price = ((cart_item.item.price * 1.1).round(2)).ceil * (cart_item.item_count)
      @total_price += tax_price
    end
  end

  def create
    @item_count = params[:item_count] ? params[:item_count] : params[:cart_item][:item_count]
    @cart_item = CartItem.new({customer_id:params[:customer_id], item_id:params[:item_id], item_count:@item_count})
    # binding.pry
    if (CartItem.where(item_id: params[:item_id]).where(customer_id: current_customer.id).exists?) && (@item_count.present?)
      @cart_item = CartItem.find_by(item_id: params[:item_id],customer_id: current_customer.id)
      @cart_item.item_count += @item_count.to_i
      @cart_item.save
      redirect_to action: :cart
    elsif @cart_item.save
      redirect_to action: :cart
    else
      @item = Item.find(params[:item_id])
      @genres = Genre.all
      render "public/items/show"
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_count_params)
        redirect_to action: :cart
    else
      flash[:alert] = '数量を整数で入力してください。'
      redirect_to action: :cart

    # @cart_items = CartItem.where(customer_id: current_customer.id)
    # @total_price = 0
    # @cart_items.each do |cart_item|
    #   tax_price = ((cart_item.item.price * 1.1).round(2)).ceil * (cart_item.item_count)
    #   @total_price += tax_price
      # end
    # render "cart"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to action: :cart
  end

  def destroy_all
    CartItem.where(customer_id: current_customer.id).destroy_all
    redirect_to action: :cart
  end


  private

  def cart_item_params
    params.permit(:customer_id, :item_id, :item_count)
  end

  def cart_item_count_params
    params.require(:cart_item).permit(:customer_id, :item_id, :item_count)
  end

end
