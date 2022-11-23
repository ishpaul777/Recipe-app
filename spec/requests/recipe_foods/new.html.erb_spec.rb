require 'rails_helper'

RSpec.describe 'recipe_foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Jhon', email: 'Jhon@mail.com', password: '123456') }
  let(:food) { user.foods.create(name: 'Banana', units: 'Kg', price: 20) }
  let(:recipe) do
    user.recipes.create(name: 'cake', preparation_time: 1, cooking_time: 10, description: 'cake', public: true,
                        user_id: user.id)
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_recipe_recipe_food_path(recipe)
    end

    it 'should return status correct (ok)' do
      expect(response).to have_http_status('302')
    end

    it 'should return html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
