require 'spec_helper'

describe Loan do


  describe "reference_number" do

    it "should validate for a emptiness" do
      loan = Loan.new()
      loan.save
      loan.errors[:reference_number].should_not be_empty
    end

    it "should validate for a uniqueness" do
      customer = Person.new(:name => "chandu", :village=>"nagpur", :contact_number => "9999999999", :role=>"customer")
      gaurantor = Person.new(:name => "andu", :village=>"indu", :contact_number => "9999999999", :role=>"gaurantor")
      vehicle = Vehicle.new(:model => "sumo", :registration_number => "MH-12CX10")
      loan = Loan.create(:reference_number => "111", :active => true, :amount=>"10000",:rate_of_interest_per_annum =>20,
                                 :installment_term => 6, :number_of_installments => 10, :customer => customer, :gaurantor => gaurantor, :vehicle => vehicle)
      loan.save
      loan.errors[:reference_number].should be_empty

      loan = Loan.new(:reference_number => "111")
      loan.save
      loan.errors[:reference_number].should_not be_empty
    end

  end


  it "has one customer person and a gaurantor person" do
    customer = Person.new(:name => "chandu", :village=>"nagpur", :contact_number => "9999999999", :role=>"customer")
    gaurantor = Person.new(:name => "andu", :village=>"indu", :contact_number => "9999999999", :role=>"gaurantor")
    vehicle = Vehicle.new(:model => "sumo", :registration_number => "MH-12CX10")
    @chandu_loan = Loan.create(:reference_number => "1", :active => true, :amount=>"10000",:rate_of_interest_per_annum =>20,
                               :installment_term => 6, :number_of_installments => 10, :customer => customer, :gaurantor => gaurantor, :vehicle => vehicle)

    loan_from_db = Loan.where(:reference_number => "1").first
    loan_from_db.customer.name.should  == "chandu"
    loan_from_db.customer.role.should  == "customer"

    loan_from_db.gaurantor.name.should  == "andu"
    loan_from_db.gaurantor.role.should  == "gaurantor"

    @chandu_loan.delete
  end

  describe "defaulters" do

    before(:each) do
      customer = Person.new(:name => "chandu", :village=>"nagpur", :contact_number => "9999999999", :role=>"customer")
      gaurantor = Person.new(:name => "andu", :village=>"indu", :contact_number => "9999999999", :role=>"gaurantor")
      vehicle = Vehicle.new(:model => "sumo", :registration_number => "MH-12CX10")
      @chandu_loan = Loan.create(:reference_number => "1", :active => true, :amount=>"10000",:rate_of_interest_per_annum =>20,
                                 :installment_term => 6, :number_of_installments => 10, :customer => customer, :gaurantor => gaurantor, :vehicle => vehicle)

      customer = Person.new(:name => "bholu", :village=>"nagpur", :contact_number => "9999999999", :role=>"customer")
      gaurantor = Person.new(:name => "bholi", :village=>"indu", :contact_number => "9999999999", :role=>"gaurantor")
      vehicle = Vehicle.new(:model => "sumo", :registration_number => "MH-12CX10")
      @bhola_loan = Loan.create(:reference_number => "2",:active => true, :amount=>"10000",:rate_of_interest_per_annum =>20,
                                :installment_term => 1, :number_of_installments => 4, :customer => customer, :gaurantor => gaurantor, :vehicle => vehicle)

      customer = Person.new(:name => "chalu", :village=>"nagpur", :contact_number => "9999999999", :role=>"customer")
      gaurantor = Person.new(:name => "bholi", :village=>"indu", :contact_number => "9999999999", :role=>"gaurantor")
      vehicle = Vehicle.new(:model => "sumo", :registration_number => "MH-12CX10")
      @chalu_loan = Loan.create(:reference_number => "3", :active => false, :amount=>"10000",:rate_of_interest_per_annum =>20,
                                :installment_term => 3, :number_of_installments => 5, :customer => customer, :gaurantor => gaurantor, :vehicle => vehicle)

      customer = Person.new(:name => "golu", :village=>"nagpur", :contact_number => "9999999999", :role=>"customer")
      gaurantor = Person.new(:name => "bholi", :village=>"indu", :contact_number => "9999999999", :role=>"gaurantor")
      vehicle = Vehicle.new(:model => "sumo", :registration_number => "MH-12CX10")
      @golu_loan = Loan.create(:reference_number => "3", :active => false, :amount=>"10000",:rate_of_interest_per_annum =>20,
                                :installment_term => 3, :number_of_installments => 6, :customer => customer, :gaurantor => gaurantor, :vehicle => vehicle)
    end

    after(:each) do
      @chandu_loan.delete
      @bhola_loan.delete
      @chalu_loan.delete
      @golu_loan.delete
    end

    it "should not fetch all non active loans" do
      Loan.all_with_pending_payments.count.should == 2
    end

    it "should fetch all active loans who have pending payments for the current installment term " do
      @bhola_loan.update_attributes(:created_at => DateTime.now - 4.months)
      Payment.create(:amount=>1000, :date=> Date.today - 1.month , :loan_id => @bhola_loan.id)
      Payment.create(:amount=>1000, :date=> Date.today - 1.month , :loan_id => @chandu_loan.id)
      Payment.create(:amount=>1000, :date=> Date.today - 2.month , :loan_id => @golu_loan.id)
      Payment.create(:amount=>1000, :date=> Date.today - 1.month , :loan_id => @golu_loan.id)

      Loan.all_with_pending_payments.count.should == 1
    end

    pending "should take care of non-divisible number of installments and installment term" do
           #maybe will implement
    end

    pending "should use created_at date and total amount expected from payments as well for calculation" do
          #maybe will implement
    end

  end
end
