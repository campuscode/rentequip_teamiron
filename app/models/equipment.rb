class Equipment < ActiveRecord::Base
  has_and_belongs_to_many :contracts
  has_many :prices
end
