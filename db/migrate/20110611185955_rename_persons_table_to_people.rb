class RenamePersonsTableToPeople < ActiveRecord::Migration
  def self.up
    rename_table :persons, :people
  end

  def self.down
    rename_table :people , :persons
  end
end
