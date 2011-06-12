class Vehicle < ActiveRecord::Base
  validates_presence_of :model, :registration_number
  belongs_to :loan
end
