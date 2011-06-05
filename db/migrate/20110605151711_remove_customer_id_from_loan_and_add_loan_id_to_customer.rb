class RemoveCustomerIdFromLoanAndAddLoanIdToCustomer < ActiveRecord::Migration
  def self.up
    remove_column :loans, :customer_id
    add_column :customers, :loan_id, :integer
  end

  def self.down
    add_column :loans, :customer_id, :integer
    remove_column :customers, :loan_id
  end
end
