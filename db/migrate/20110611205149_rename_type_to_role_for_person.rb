class RenameTypeToRoleForPerson < ActiveRecord::Migration
  def self.up
    rename_column :people , :type , :role
  end

  def self.down
    rename_column :people, :role , :type
  end
end
