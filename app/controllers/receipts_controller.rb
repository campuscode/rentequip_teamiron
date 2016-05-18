class ReceiptsController < ApplicationController
  def create
    @contract = Contract.find(params[:contract_id])
    @receipt = @contract.receipt || Receipt.create(contract: @contract)
    redirect_to [@contract, @receipt]
  end

  def show
    @receipt = Receipt.find(params[:id])
  end
end
