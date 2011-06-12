require 'spec_helper'

describe Person do

  describe "role" do

    it "should be a customer or a gaurantor" do
      customer = Person.new(:name => "chandan",:role => :customer)
      customer.save
      customer.errors.should be_empty

      gaurantor = Person.new(:name => "anand",:role => :gaurantor)
      gaurantor.save
      gaurantor.errors.should be_empty

      something_else = Person.new(:name => "anand",:role => :something_else)
      something_else.save
      something_else.errors.should_not be_empty
      something_else.errors[:role].first.should == "something_else is not a valid role"

    end

  end

end
