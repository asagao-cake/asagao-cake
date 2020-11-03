class ApplicationController < ActionController::Base

  private
    def after_sign_in_path_for(admin)
        admin_path
    end

    def after_sign_out_path_for(admin)
        admin_sign_in_path
    end
end