require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jhon', email: 'Jhon@mail.com', password: '123456') }
  let(:food) { user.foods.create(name: 'Banana', units: 'Kg', price: 20) }

  describe 'GET /index' do
    before do
      sign_in user
      get foods_path
    end

    it 'should return status correct (ok)' do
      expect(response).to have_http_status('302')
    end

    it 'should return html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
