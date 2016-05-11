class Contract < ActiveRecord::Base
  has_and_belongs_to_many :equipment
  validates :deadline, presence: true
end
