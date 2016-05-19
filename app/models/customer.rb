class Customer < ActiveRecord::Base
  validates :company_name, :cnpj, :contact_name, :tel, :contact_email,
            :billing_address, presence: true
end
