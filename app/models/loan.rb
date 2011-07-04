class Loan < ActiveRecord::Base
  INSTALLMENT_TERMS = {"1 month"=> 1, "3 months" => 3, "6 months" => 6}
  ACTIVE_HASH = {"Yes"=> true, "No" => false}

  validates_presence_of :reference_number
  validates_uniqueness_of :reference_number
  validates_presence_of :amount, :rate_of_interest_per_annum, :number_of_installments, :installment_term

  has_one :customer, :class_name => "Person", :conditions => "role = 'customer'"
  has_one :gaurantor, :class_name => "Person", :conditions => "role = 'gaurantor'"
  has_one :vehicle
  has_many :payments


  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :gaurantor
  accepts_nested_attributes_for :vehicle

  def self.all_with_pending_payments
    loans_with_pending_payments = Loan.where(:active => true).collect do |loan|
            loan unless loan.has_payment_made_for_current_installment_term?
    end
    loans_with_pending_payments.compact
  end

  def has_payment_made_for_current_installment_term?
    total_payments_for_loan = self.payments.count
    expected_payments = (number_of_installments / installment_term)
    total_payments_for_loan == expected_payments
  end

end
