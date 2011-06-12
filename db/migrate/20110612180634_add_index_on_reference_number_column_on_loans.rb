class AddIndexOnReferenceNumberColumnOnLoans < ActiveRecord::Migration
  def self.up
    add_index :loans, :reference_number, :name => "loans_reference_number_index", :unique => true
  end

  def self.down
    remove_index :loans, "loans_reference_number_index"
  end
end
