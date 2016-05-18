class ContractsController < ApplicationController
  def show
    @contract = Contract.find(params[:id])
  end

  def index
    @contracts = Contract.all
  end

  def new
    @contract = Contract.new
    @collection = [3, 7, 15, 30]
  end

  def create
    @contract = Contract.create(params_contract)
    if @contract.persisted?
      redirect_to contract_path(@contract)
    else
      flash[:error] = 'Favor preencher os campos obrigatórios'
      render :new
    end
  end

  private

  def params_contract
    params.require(:contract).permit(:responsable, :client, :rental_period,
                                     :amount, :delivery_address, :started_at,
                                     equipment_ids: [])
  end
end
