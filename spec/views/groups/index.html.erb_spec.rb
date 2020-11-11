require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  let(:user) { User.create(Name: 'Group Owner', icon: 'user-icon') }

  before(:each) do
    assign(:groups, [
      user.groups.create!(
        Name: "Name1",
        Icon: "https://www.flaticon.com/svg/static/icons/svg/926/926158.svg"
      ),
      user.groups.create!(
        Name: "Name2",
        Icon: "https://www.flaticon.com/svg/static/icons/svg/926/926158.svg"
      )
    ])
  end

  it "renders a list of groups" do
    render
    expect(rendered).to match(/Name1/)
  end

  it "renders a list of groups" do
    render
    expect(rendered).to match(/Name2/)
  end
end
