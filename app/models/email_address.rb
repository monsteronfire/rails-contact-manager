class EmailAddress < ApplicationRecord
  validates :address, presence: true
  belongs_to :contact, polymorphic: true
end
