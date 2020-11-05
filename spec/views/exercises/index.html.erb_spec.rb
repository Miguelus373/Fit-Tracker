require 'rails_helper'

RSpec.describe "exercises/index", type: :view do
  before(:each) do
    assign(:exercises, [
      Exercise.create!(
        AuthorId: 2,
        Name: "Name",
        Amount: 3
      ),
      Exercise.create!(
        AuthorId: 2,
        Name: "Name",
        Amount: 3
      )
    ])
  end

  it "renders a list of exercises" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
