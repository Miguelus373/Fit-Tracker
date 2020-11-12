require 'rails_helper'

RSpec.describe 'users/new', type: :feature do
  it 'renders new user form' do
    visit new_user_url
    expect(:Name).to match(/Name/)
  end
end
