class AddNotesToLoan < ActiveRecord::Migration
  def self.up
    add_column :loans, :notes, :string
  end

  def self.down
    remove_column :loans, :notes
  end

end
