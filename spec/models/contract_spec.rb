require 'spec_helper'

describe Contract do
  it 'has a valid 3 days deadline' do
    build(:contract, rental_period: 3, started_at: 2015-12-08)
    expect(:deadline).to eq(2015-12-11)
  end
  it 'has a valid 3 days deadline on the following year'
    build(:contract, started_at: 2015-12-30)
    expect(:deadline).to eq(2016-01-02)
  end
  it 'has a valid 7 days deadline' do
    build(:contract, rental_period: 7, started_at: 2015-12-08)
    expect(:deadline).to eq(2015-12-15)
  end
  it 'has a valid 7 days deadline on the following year'
    build(:contract, rental_period: 7, started_at: 2015-12-30)
    expect(:deadline).to eq(2016-01-06)
  end
  it 'has a valid 15 days deadline' do
    build(:contract, rental_period: 15, started_at: 2015-12-01)
    expect(:deadeline).to eq(2015-12-16)
  end
  it 'has a valid 15 days deadline on the following year'
    build(:contract, rental_period: 15, started_at: 2015-12-30)
    expect(:deadline).to eq(2016-01-14)
  end
  it 'has a valid 30 days deadline' do
    build(:contract, rental_period: 30,  started_at: 2015-12-01)
    expect(:deadline).to eq(2015-12-31)
  end
  it 'has a valid 30 days deadline on the following year'
    build(:contract, rental_period: 30, started_at: 2015-12-08)
    expect(:deadline).to eq(2016-01-07)
  end
end
