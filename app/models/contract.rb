class Contract < ActiveRecord::Base
  has_and_belongs_to_many :equipment
  belongs_to :customer

  validates :rental_period, :responsable, :customer, :amount, :equipment,
            :delivery_address, presence: true

  def deadline
    Time.zone.now + rental_period.day
  end
end
