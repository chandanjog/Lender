class ChangeContactToStringInPerson < ActiveRecord::Migration
  def self.up
    remove_column :people, :contact_number
    remove_column :people, :contact_number_secondary
    add_column :people, :contact_number, :string
    add_column :people, :contact_number_secondary, :string
  end

  def self.down
    remove_column :people, :contact_number_secondary
    remove_column :people, :contact_number
    add_column :people, :contact_number, :integer
    add_column :people, :contact_number_secondary, :integer
  end
end
