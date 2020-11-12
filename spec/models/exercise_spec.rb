require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:user) { User.create(Name: 'Exercise Owner', icon: 'user-icon') }
  let(:valid_attributes) { { Name: 'Exercise Name', time: 10 } }
  let(:invalid_attributes) { { Name: '', time: -10 } }

  describe 'Validations tests for Exercise model' do
    context 'with valid parameters' do
      it 'creates a new Exercise' do
        expect(
          user.exercises.new(valid_attributes)
        ).to be_valid
      end
    end

    context 'with invalid parameters' do
      it "doesn't create a new Exercise" do
        expect(
          user.exercises.new(invalid_attributes)
        ).not_to be_valid
      end
    end
  end

  context 'Association tests for Exercise model' do
    it 'should belong to user' do
      e = Exercise.reflect_on_association(:user)
      expect(e.macro).to eq(:belongs_to)
    end
    it 'should have many groups' do
      e = Exercise.reflect_on_association(:groups)
      expect(e.macro).to eq(:has_many)
    end
    it 'should have many categories' do
      e = Exercise.reflect_on_association(:categories)
      expect(e.macro).to eq(:has_many)
    end
  end
end
