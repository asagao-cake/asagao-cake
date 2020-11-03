class ApplicationController < ActionController::Base

def current_cart
    if session[:customer_id]
      @cart_item = CartItem.find(session[:customer_id])
    else
      @cart_item = CartItem.create
      session[:customer_id] = @customer.id
    end
end

  private
    def after_sign_in_path_for(admin)
        admin_path
    end

    def after_sign_out_path_for(admin)
        admin_sign_in_path
    end
end