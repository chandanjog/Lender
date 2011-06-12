class Person < ActiveRecord::Base
  validates :role, :inclusion =>{ :in => ["customer", "gaurantor"], :message => "%{value} is not a valid role"}
  belongs_to :loan
end
