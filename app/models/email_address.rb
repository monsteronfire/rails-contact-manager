class EmailAddress < ActiveRecord::Base
  validates :address, :contact_id, presence: true
  belongs_to :contact, polymorphic: true, optional: true
end
