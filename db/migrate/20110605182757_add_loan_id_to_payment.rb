class AddLoanIdToPayment < ActiveRecord::Migration
  def self.up
    add_column :payments, :loan_id, :integer
  end

  def self.down
    remove_column :payments, :loan_id
  end
end
