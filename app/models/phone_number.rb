class PhoneNumber < ApplicationRecord
  validates :person_id, presence: true
  belongs_to :person
end
