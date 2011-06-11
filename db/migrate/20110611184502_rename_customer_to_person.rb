class RenameCustomerToPerson < ActiveRecord::Migration
  def self.up
    rename_table :customers, :persons
  end

  def self.down
    rename_table :persons , :customers
  end
end
