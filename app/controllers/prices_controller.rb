class PricesController < ApplicationController
  def index
    @prices = Price.all
  end

  def new
    @price = Price.new
  end

  def create
    @price = Price.new(params_prices)
    if @price.save
      redirect_to prices_path
    else
      flash[:error] = 'Favor preencher os campos obrigatórios'
      render :new
    end
  end

  private

  def params_prices
    params.require(:price).permit(:equipment_id, :duration, :total_value)
  end
end
