class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

def current_cart
    if session[:customer_id]
      @cart_item = CartItem.find(session[:customer_id])
    else
      @cart_item = CartItem.create
      session[:customer_id] = @customer.id
    end
end

  private
  def after_sign_in_path_for(resource)
    case resource
    when  Customer
      root_path
    when Admin
      admin_items_path
    end
  end


  # if current_user == Customer
  #   def after_sign_out_path_for(public)
  #     root_path
  #   end
  # else
  #   def after_sign_out_path_for(admin)
  #       admin_sign_in_path
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number])
  end

end
