require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number) { PhoneNumber.new(number: '111222333', contact_id: 1) }

  it 'is valid' do
    expect(phone_number).to be_valid
  end

  it 'must have a reference to a person' do
    phone_number.contact_id = nil
    expect(phone_number).not_to be_valid
  end

  it 'is associated with a person' do
    expect(phone_number).to respond_to(:person)
  end
end
