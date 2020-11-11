require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    Name: 'MyString',
                    icon: 'https://www.flaticon.com/svg/static/icons/svg/926/926158.svg'
                  ))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[Name]'

      assert_select 'input[name=?]', 'user[icon]'
    end
  end
end
