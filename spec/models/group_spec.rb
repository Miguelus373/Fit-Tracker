require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(Name: 'Group Owenr', icon: 'user-icon') }
  let(:valid_attributes) { {Name: 'Group Name', Icon: 'group-icon'} }
  let(:invalid_attributes) { {Name: '', Icon: ''} }

  describe "Validations tests for Group model" do
    context "with valid parameters" do
      it "creates a new Group" do
        expect(
          user.groups.new valid_attributes
        ).to be_valid
      end
    end

    context "with invalid parameters" do
      it "doesn't create a new Group" do
        expect(
          user.groups.new invalid_attributes
        ).not_to be_valid
      end
    end
  end

  context 'Association tests for Group model' do
    it 'should belong to user' do
      g = Group.reflect_on_association(:user)
      expect(g.macro).to eq(:belongs_to)
    end
    it 'should have many exercises' do
      g = Group.reflect_on_association(:exercises)
      expect(g.macro).to eq(:has_many)
    end
    it 'should have many categories' do
      g = Group.reflect_on_association(:categories)
      expect(g.macro).to eq(:has_many)
    end
  end
end
