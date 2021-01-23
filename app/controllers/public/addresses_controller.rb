class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def create
      @address = Address.new(address_params)
      if @address.save
        redirect_to addresses_path
      else
        flash[:notice] = "You have add new address successfully."
        render "index"
      end
  end

  def edit
  @address = Address.find(params[:id])
  end

  def update
      @address = Address.find(params[:id])
      if @address.update(address_params)
        redirect_to addresses_path
      else
        render "edit"
      end
  end

  def destroy
      @address = Address.find(params[:id])
      @address.delete
      redirect_to addresses_path
  end

  private

  def address_params
      params.require(:address).permit(:posital_code, :address, :name)
  end

end
