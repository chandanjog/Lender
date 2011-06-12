class Person < ActiveRecord::Base
  validates_presence_of :name, :village, :contact_number
  validates :role, :inclusion =>{ :in => ["customer", "gaurantor"], :message => "%{value} is not a valid role"}
  belongs_to :loan
end
