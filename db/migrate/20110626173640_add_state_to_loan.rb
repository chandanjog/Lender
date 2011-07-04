class AddStateToLoan < ActiveRecord::Migration
  def self.up
    add_column :loans, :active, :boolean
  end

  def self.down
    remove_column :loans, :active
  end
end
