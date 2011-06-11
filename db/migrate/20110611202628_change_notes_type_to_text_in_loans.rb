class ChangeNotesTypeToTextInLoans < ActiveRecord::Migration
  def self.up
    remove_column :loans, :notes
    add_column :loans, :notes, :text
  end

  def self.down
    remove_column :loans, :notes
    add_column :loans, :notes, :string
  end
end
