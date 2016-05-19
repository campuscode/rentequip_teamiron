require 'rails_helper'

describe Contract do
  it 'has a valid 3 days deadline' do
    contract = create(:contract, rental_period: 3, equipment:
                      [create_equipment], started_at: Time.zone.today)
    expect(contract.deadline).to eq(Time.zone.today +
                                    contract.rental_period.days)
  end

  it 'has a valid deadline on the starting day' do
    contract = create(:contract, rental_period: 0, equipment:
                      [create_equipment], started_at:  Time.zone.today)
    expect(contract.deadline).to eq(Time.zone.today)
  end

  it 'has an invalid negative deadline' do
    contract = create(:contract, rental_period: -1, equipment:
                      [create_equipment], started_at: Time.zone.today)
    expect(contract.deadline).to eq(Time.zone.today)
  end

  def create_equipment
    build(:equipment)
  end
end
