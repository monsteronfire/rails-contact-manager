class PhoneNumber < ActiveRecord::Base
  validates :number, :contact_id,  presence: true
  belongs_to :contact, polymorphic: true, optional: true
end
