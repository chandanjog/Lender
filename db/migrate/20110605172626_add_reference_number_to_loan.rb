class AddReferenceNumberToLoan < ActiveRecord::Migration
  def self.up
    add_column :loans, :reference_number, :integer
  end

  def self.down
    remove_column :loans, :reference_number
  end
end
