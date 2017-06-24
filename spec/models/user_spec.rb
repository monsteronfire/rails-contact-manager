require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(name: 'alicesmith', uid: '4321567', provider: 'twitter')
  end
end
