require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        Name: "Name",
        Icon: "Icon"
      ),
      Group.create!(
        Name: "Name",
        Icon: "Icon"
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Icon".to_s, count: 2
  end
end
