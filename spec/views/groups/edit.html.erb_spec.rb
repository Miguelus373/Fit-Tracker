require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      Name: "MyString",
      Icon: "MyString"
    ))
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(@group), "post" do

      assert_select "input[name=?]", "group[Name]"

      assert_select "input[name=?]", "group[Icon]"
    end
  end
end
