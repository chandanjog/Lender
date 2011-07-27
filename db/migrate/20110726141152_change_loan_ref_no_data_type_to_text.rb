class ChangeLoanRefNoDataTypeToText < ActiveRecord::Migration
  def self.up
    change_table :loans do |t|
      t.change :reference_number, :string
    end
  end

  def self.down
    change_table :loans do |t|
      t.change :reference_number, :integer
    end
  end
end
