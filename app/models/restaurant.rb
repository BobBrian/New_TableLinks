class Restaurant < ApplicationRecord
  # belongs_to :user
  # has_many :tables
  # has_many :reservations

  belongs_to :user
  has_many :tables
  has_many :reservations

  accepts_nested_attributes_for :tables
end
