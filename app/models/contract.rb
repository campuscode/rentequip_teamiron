class Contract < ActiveRecord::Base
  has_and_belongs_to_many :equipment
  belongs_to :client
  validates :deadline, presence: true

  #TODO remove this method when merge with Leonardo's code
  def rental_period
    12345678900000
  end
end
