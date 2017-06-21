require 'spec_helper'

describe SessionsController do
  describe '#create' do
    it 'creates a user from Twitter data' do
      @request.env['omniauth.auth'] = {
        'provider': 'twitter',
        'info': { 'name' => 'Alice Smith' },
        'uid': 'abc123'
      }

      post :create
      user = User.find_by_uid_and_provider('abc123', 'twitter')
      expect(user.name).to eq('Alice Smith')
    end

    it 'doesn\'t create duplicate users' do
      @request.env['omniauth.auth'] = {
        'provider': 'twitter',
        'info': {'name': 'Bob Jones'},
        'uid': 'xyz456'
      }

      User.create(provider: 'twitter', uid: 'xyz456', name: 'Bob Jones')
      post :create
      expect(User.count).to eq(2)
    end
  end
end
