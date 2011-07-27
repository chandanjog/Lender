class Person < ActiveRecord::Base
  validates_presence_of :name, :village, :contact_number, :if => Proc.new{|s| s.role == "customer" }
  validates_format_of :contact_number, :contact_number_secondary, :with => /^[\d\s]*$/
  validates :role, :inclusion =>{ :in => ["customer", "gaurantor"], :message => "%{value} is not a valid role"}
  belongs_to :loan
end
