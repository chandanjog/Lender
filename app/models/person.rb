class Person < ActiveRecord::Base
  validates_presence_of :name, :village, :contact_number
  validates_format_of :contact_number, :contact_number_secondary, :with => /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/
  validates :role, :inclusion =>{ :in => ["customer", "gaurantor"], :message => "%{value} is not a valid role"}
  belongs_to :loan
end
