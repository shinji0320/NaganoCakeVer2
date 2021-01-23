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
       flash.now[:notice] = "登録情報が編集されました"
      redirect_to public_customer_path(@customer.id)
    else
      render "edit"
    end
  end

  def confirm
    @customer = Customer.find(params[:id])
  end

  def hide
    @cusromer = Customer.find(current_customer.id)
    @cusromer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました。今までのご利用ありがとうございました。"
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name,
      :postal_code, :address, :telephone_number, :is_deleted)
  end

end
