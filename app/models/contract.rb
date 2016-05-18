class Contract < ActiveRecord::Base
  has_and_belongs_to_many :equipment
  belongs_to :customer
  has_one :receipt

  validates :rental_period, :responsable, :customer, :amount, :equipment,
            :delivery_address, presence: true

  def deadline
    if rental_period
      Time.zone.now + rental_period.day
    else
      Time.zone.now + 7.days
    end
  end
end
