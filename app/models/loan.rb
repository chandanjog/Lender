class Loan < ActiveRecord::Base
  has_one :customer, :class_name => "Person", :conditions => "role = 'customer'"
  has_one :gaurantor, :class_name => "Person", :conditions => "role = 'gaurantor'"
  has_one :vehicle
  has_many :payments

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :gaurantor
  accepts_nested_attributes_for :vehicle
end
