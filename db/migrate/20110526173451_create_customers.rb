class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :village
      t.integer :contact_number

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
