class Contract < ActiveRecord::Base
  has_and_belongs_to_many :equipment
  validates :rental_period, :responsable, :client, :amount, :equipment,
            :delivery_address, :started_at, presence: true

  before_save :set_deadline

  protected

  def set_deadline
    self.deadline = if rental_period < 0
                      started_at
                    else
                      started_at + rental_period.day
                    end
  end
end
