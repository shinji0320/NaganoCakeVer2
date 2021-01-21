class Public::CustomersController < ApplicationController
before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer.id), notice: '会員情報を編集しました'
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
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name,
      :postal_code, :address, :telephone_number, :is_deleted)
  end

end
