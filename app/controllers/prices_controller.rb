class PricesController < ApplicationController
  def index
    @price = Price.all
  end
end
