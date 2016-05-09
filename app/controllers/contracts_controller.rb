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
    @contract = Contract.new(params_contract)
    @contract.save
    redirect_to @contract
  end

  private

  def params_contract
    params.require(:contract).permit(:responsable, :client, :deadline,
                                     :amount, :delivery_address,
                                     equipment_ids: [])
  end
end
