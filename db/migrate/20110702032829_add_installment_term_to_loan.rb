class AddInstallmentTermToLoan < ActiveRecord::Migration
  def self.up
    add_column :loans, :installment_term, :integer
  end

  def self.down
    remove_column :loans, :installment_term
  end
end
