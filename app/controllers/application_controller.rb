class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when  Customer
      root_path
    when Admin
      admin_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when  :customer
      root_path
    when :admin
      admin_sign_in_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number])
  end

end
