class Public::OrdersController < ApplicationController

    def new #注文情報入力画面
        @orders = current_customer.orders.new
    end

    def confirm #注文情報確認
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @shipping_fee = 800
        @total_price = 0
        @cart_items.each do |cart_item|
          tax_price = ((cart_item.item.price * 1.1).round(2)).ceil * (cart_item.item_count)
          @total_price += tax_price
        end
        @billing_amount = @shipping_fee + @total_price
        @order = current_customer.orders.new(order_params)
        case params[:delivery_address_type]
        when "ご自身の住所"
             @order.postcode = current_customer.postcode
             @order.address = current_customer.address
             @order.name = current_customer.last_name + current_customer.first_name
        when "登録済み住所から選択"
             shipping_address = ShippingAddress.find(params[:shipping_address_id])
             @order.postcode = shipping_address.postcode
             @order.address = shipping_address.address
             @order.name = shipping_address.name
        when "新しいお届け先"
             shipping_address = current_customer.shipping_addresses.new
             shipping_address.postcode = params[:postcode]
             shipping_address.address = params[:address]
             shipping_address.name = params[:name]
             shipping_address.save
        end
    end

    def create #注文情報登録
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.save
          current_customer.cart_items.each do |cart_item|
            @order_item = @order.order_items.new
            @order_item.order_id = @order.id
            @order_item.item_id = cart_item.item_id
            @order_item.item_count = cart_item.item_count
            @order_item.price_including_tax = (cart_item.item.price * 1.1).round(2).ceil
            @order_item.save
          end
        current_customer.cart_items.destroy_all
        redirect_to orders_complete_path
    end

    def order_complete #注文完了
    end

    def index #注文履歴一覧
    end

    def show #注文履歴詳細
    end

    private

    def order_params
        params.permit(:payment_method, :address, :postcode, :name)
    end

end
