class PhoneNumber < ApplicationRecord
  validates :person_id, :number,  presence: true
  belongs_to :person, optional: true
  belongs_to :company, optional: true
end
