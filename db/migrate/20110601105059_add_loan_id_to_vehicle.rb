class AddLoanIdToVehicle < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :loan_id, :integer
  end

  def self.down
    add_column :vehicles, :loan_id
  end
end
