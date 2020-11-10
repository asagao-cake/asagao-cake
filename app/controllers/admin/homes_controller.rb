class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  before_action :no_admin
  
  def no_admin(current_user)
    case current_user
    when Customer
      redirect_to root_path
      
  end


  def top
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
  end

end
