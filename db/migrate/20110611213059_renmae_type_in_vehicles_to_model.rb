class RenmaeTypeInVehiclesToModel < ActiveRecord::Migration
  def self.up
    rename_column :vehicles , :type , :model
  end

  def self.down
    rename_column :vehicles , :model , :type
  end
end
