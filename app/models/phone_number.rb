class PhoneNumber < ApplicationRecord
  validates :contact_id, :number,  presence: true
  belongs_to :person, optional: true
  belongs_to :company, optional: true
end
