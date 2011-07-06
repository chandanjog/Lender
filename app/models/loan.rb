class Loan < ActiveRecord::Base
  INSTALLMENT_TERMS = {"1 month"=> 1, "3 months" => 3, "6 months" => 6}
  ACTIVE_HASH = {"Yes"=> true, "No" => false}

  validates_presence_of :reference_number
  validates_uniqueness_of :reference_number
  validates_presence_of :amount, :rate_of_interest_per_annum, :number_of_installments, :installment_term, :emi

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
    loans_with_pending_payments.compact.sort_by{|x| x.payments.sum('amount')}
  end

#  def has_payment_made_for_current_installment_term?
#     p "--------------------------"
#     months_gone = ((Date.today - Date.strptime(created_at.to_s.split(" ")[0])).to_i / 30 )
#     p "months_gone::: #{months_gone}"
#     p "months_gone % installment_term ::: #{months_gone % installment_term}"
#     p "months_gone / installment_term ::: #{months_gone / installment_term}"
#     p "payments count ::: #{payments.count}"
#     p "(months_gone % installment_term) != 0 ::: #{(months_gone % installment_term) != 0}"
#     p "payments.count == (months_gone/installment_term) ::: #{payments.count == (months_gone/installment_term)}"
#
#     return true if (months_gone % installment_term) != 0
#     return true if payments.count == (months_gone/installment_term)
#     false
#  end

  def has_payment_made_for_current_installment_term?
     p "--------------------------"
     p "months_gone::: #{months_gone}"
     p "months_gone % installment_term ::: #{months_gone % installment_term}"
     p "months_gone / installment_term ::: #{months_gone / installment_term}"
     p "payments sum ::: #{payments.sum('amount')}"
     p "payments expected ::: #{(months_gone / installment_term) * emi}"

     is_eligible_for_payment_for_current_term? && has_paid? ? false : true
  end

  private

  def months_gone
    ((Date.today - Date.strptime(created_at.to_s.split(" ")[0])).to_i / 30 )
  end

  def is_eligible_for_payment_for_current_term?
    (months_gone % installment_term) == 0
  end

  def has_paid?
    payments.sum('amount') < (months_gone / installment_term) * emi
  end

end
