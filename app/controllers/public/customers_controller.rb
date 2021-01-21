class Public::CustomersController < ApplicationController
before_action :authenticate_customer!
  def show
    @customer = Customer.find(current_customer)
  end

  def edit
    @cusromer = Customer.find(current_customer)
  end

  def update
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer.id)
    else
      render "edit"
    end
  end

  def confirm
  end

  def hide
    @cusromer = Customer.find(params[:id])
    @customer.is_deleted
  end

  private

  def customer_params
    params.require(:cusromer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name,
      :postal_code, :address, :telephone_number, :is_deleted)
  end

end
