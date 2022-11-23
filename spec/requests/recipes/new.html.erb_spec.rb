require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jhon', email: 'Jhon@mail.com', password: '123456') }

  describe 'GET /public' do
    before do
      sign_in user
      get new_recipe_path
    end

    it 'should return status correct (ok)' do
      expect(response).to have_http_status('302')
    end

    it 'should return html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
