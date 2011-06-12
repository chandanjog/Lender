class Payment < ActiveRecord::Base
  validates_presence_of :amount, :date
  belongs_to :loan
end
