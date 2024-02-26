class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :reservations


  # Add is_available to the list of accessible attributes
  attr_accessible :is_available

  # Add any validations as needed
  validates :is_available, inclusion: { in: [true, false] }
end
