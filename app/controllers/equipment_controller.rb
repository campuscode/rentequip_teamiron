class EquipmentController < ApplicationController
  def index
    @equipment = EquipmentPresenter.new(Equipment.all)
  end
end
