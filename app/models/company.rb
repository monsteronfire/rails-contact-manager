class Company < ApplicationRecord
  validates :name, presence: true
  has_many :phone_numbers
end
