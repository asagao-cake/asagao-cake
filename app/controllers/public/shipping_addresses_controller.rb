class Public::ShippingAddressesController < ApplicationController

  def index
    @address = ShippingAddress.new
    @customer = Customer.find(current_customer.id)
    @addresses = @customer.shipping_addresses
  end

  def create
    @address = ShippingAddress.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to shipping_addresses_path
    else
      @customer = Customer.find(current_customer.id)
      @addresses = @customer.shipping_addresses
      render 'index'
    end
  end

  def edit
    @address = ShippingAddress.find(params[:id])
  end

  def update
    @address = ShippingAddress.find(params[:id])
    if @address.update(address_params)
      redirect_to shipping_addresses_path
    else
      render 'edit'
    end
  end


  def destroy
    @address = ShippingAddress.find(params[:id])
    @address.destroy
    redirect_to shipping_addresses_path
  end


private

def address_params
  params.require(:shipping_address).permit(:name, :address, :postcode)
end

end
