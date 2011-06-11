class AddContactNumberSecondaryToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :contact_number_secondary, :integer
  end

  def self.down
    remove_column :customers, :contact_number_secondary
  end
end
