class Loan < ActiveRecord::Base
  validates_presence_of :reference_number
  validates_uniqueness_of :reference_number
  validates_presence_of :amount, :rate_of_interest_per_annum

  has_one :customer, :class_name => "Person", :conditions => "role = 'customer'"
  has_one :gaurantor, :class_name => "Person", :conditions => "role = 'gaurantor'"
  has_one :vehicle
  has_many :payments


  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :gaurantor
  accepts_nested_attributes_for :vehicle

  def self.all_with_pending_payments
    loans_with_pending_payments = Loan.all.collect do |loan|
            loan unless loan.has_payment_for_current_month? loan
    end
    p "@"*10
    p loans_with_pending_payments.compact
    loans_with_pending_payments.compact
  end

  def has_payment_for_current_month? loan
    payment_for_current_month = loan.payments.where("date = ?", Date.today)
    !payment_for_current_month.empty?
  end

end
