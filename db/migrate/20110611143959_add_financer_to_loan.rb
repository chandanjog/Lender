class AddFinancerToLoan < ActiveRecord::Migration
  def self.up
    add_column :loans, :financer, :string
  end

  def self.down
    remove_column :loans, :financer
  end
end
