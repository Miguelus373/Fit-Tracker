require 'rails_helper'

RSpec.describe 'groups/new', type: :feature do
  it 'renders new group form' do
    visit new_group_url
    expect(:Name).to match(/Name/)
  end
end
