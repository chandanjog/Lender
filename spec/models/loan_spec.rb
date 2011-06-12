require 'spec_helper'

describe Loan do

  describe "reference_number" do

    it "should validate for a emptiness" do
      loan = Loan.new()
      loan.save
      loan.errors[:reference_number].should_not be_empty
    end

    it "should validate for a uniqueness" do
      loan = Loan.new(:reference_number=>"111")
      loan.save
      loan.errors[:reference_number].should be_empty

      loan = Loan.new(:reference_number=>"111")
      loan.save
      loan.errors[:reference_number].should_not be_empty
    end

  end


  it "has one customer person and a gaurantor person" do
    loan = Loan.new(:reference_number=>"111")
    loan.customer = Person.new(:name => "chandan",:role => :customer)
    loan.gaurantor = Person.new(:name => "anand", :role => :gaurantor)
    loan.save

    loan_from_db = Loan.where(:reference_number => "111").first
    p loan_from_db
    loan_from_db.customer.name.should  == "chandan"
    loan_from_db.customer.role.should  == "customer"

    loan_from_db.gaurantor.name.should  == "anand"
    loan_from_db.gaurantor.role.should  == "gaurantor"
  end
end
