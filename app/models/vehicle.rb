class Vehicle < ActiveRecord::Base
  attr_accessible :registration_number

  belongs_to :loan
end
