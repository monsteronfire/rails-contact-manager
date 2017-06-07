class PhoneNumber < ApplicationRecord
  validates :contact_id, :number,  presence: true
  belongs_to :contact, polymorphic: true, optional: true
end
