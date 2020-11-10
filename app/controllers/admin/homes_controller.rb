class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!


  def top
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @orders = Order.where(created_at: range)
  end

end
