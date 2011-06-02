class Customer < ActiveRecord::Base
  has_many :loans
end
