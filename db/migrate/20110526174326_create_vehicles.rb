class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string :type
      t.integer :registration_number
      t.string :chassis_number
      t.integer :engine_number
      t.string :dealer
      t.date :insurance_date
      t.integer :insurance_duration
      t.string :rto_agent

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
