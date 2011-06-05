class Loan < ActiveRecord::Base
  has_one :customer
  has_one :vehicle

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :vehicle
end
