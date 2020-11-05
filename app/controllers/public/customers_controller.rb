class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def unsubscribe
  end

  def quit_update
    @customer = Customer.find(current_customer.id)
    @customer.update(is_quit: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render edit
    end
  end



  private
  def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number)
  end


end
