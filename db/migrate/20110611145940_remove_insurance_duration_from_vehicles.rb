class RemoveInsuranceDurationFromVehicles < ActiveRecord::Migration
  def self.up
    remove_column :vehicles, :insurance_duration
  end

  def self.down
    add_column :vehicles, :insurance_duration, :stri
  end
end
