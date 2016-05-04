class EquipmentsController < ApplicationController
  def index
    @equipment = Equipment.find(params[:id])
  end
end
