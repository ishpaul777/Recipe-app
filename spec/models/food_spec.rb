require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food model' do
    user = User.create(name: 'User1', email: 'user1@example.com', password: 'password')
    subject { Food.new(user_id: user, name: 'Apple', units: 'grams', price: 5) }
    before { subject.save }

    it 'check the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check if the name is not exceeding 20 characters' do
      subject.name = 'Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world
        Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the measurement unit is not blank' do
      subject.units = nil
      expect(subject).to_not be_valid
    end

    it 'fails if the measurement unit is exceeding 20 characters' do
      subject.units = 'hello world hello world hello world hello world hello world hello world hello world hello world'
      expect(subject).to_not be_valid
    end

    it 'check the price is not blank' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'check if price is numeric' do
      subject.price = 'not-numeric'
      expect(subject).to_not be_valid
    end

    it 'check if price is equal or greater than one' do
      expect(subject.price).to be >= 1
    end
  end
end
