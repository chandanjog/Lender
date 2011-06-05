class AddCustomerIdToLoan < ActiveRecord::Migration
  def self.up
    add_column :loans, :customer_id, :integer
  end

  def self.down
    remove_column :loans, :customer_id
  end
end
