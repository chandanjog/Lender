class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.decimal :amount
      t.decimal :rate_of_interest_per_annum
      t.integer :number_of_installments
      t.decimal :emi

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
