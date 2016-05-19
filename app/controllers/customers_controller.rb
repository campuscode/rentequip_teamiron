class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customer_path(@customer)
    else
      flash[:error] = 'Favor preencher os campos obrigatórios'
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:company_name, :cnpj, :contact_name, :tel,
                                     :contact_email, :billing_address)
  end
end
