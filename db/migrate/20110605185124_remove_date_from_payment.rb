class RemoveDateFromPayment < ActiveRecord::Migration
  def self.up
    remove_column :payments, :date
  end

  def self.down
    add_column :payments, :date, :datetime
  end
end
