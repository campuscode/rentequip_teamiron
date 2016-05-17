class Contract < ActiveRecord::Base
  has_and_belongs_to_many :equipment
  validates :rental_period, :responsable, :client, :amount, :equipment,
            :delivery_address, presence: true

  def deadline
    Time.zone.now + rental_period.day
  end
end
