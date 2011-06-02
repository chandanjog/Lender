class Loan < ActiveRecord::Base
  belongs_to :customer
  has_one :vehicle

  accepts_nested_attributes_for :customer
end
