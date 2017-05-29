require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number) { PhoneNumber.new }

  it 'is valid' do
    expect(phone_number).to be_valid
  end
end
