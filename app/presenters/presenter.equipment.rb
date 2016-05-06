class EquipmentPresenter
  def initialize(equipment_list)
    @eq_list = equipment_list
  end

  def empty_message
    if @eq_list.empty?
      '<p>Nenhum equipamento disponivel</p>'
    end
  end
end
