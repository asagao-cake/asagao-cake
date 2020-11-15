class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!
  layout 'admin'

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(params[:id])
    else
      render 'edit'
    end
  end

  private
  def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_quit)
  end

end
