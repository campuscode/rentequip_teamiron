class ContractsController < ApplicationController
  def show
    @contract = Contract.find(params[:id])
  end

  def index
    @contracts = Contract.all
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.create(params_contract)
    if @contract.persisted?
      redirect_to contract_path(@contract)
    else
      flash[:error] = 'Favor preencher os campos obrigatórios'  
      redirect_to new_contract_path
    end
  end

  private

  def params_contract
    params.require(:contract).permit(:responsable, :client, :deadline,
                                     :amount, :delivery_address,
                                     equipment_ids: [])
  end
end
