require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        group_id: 2,
        exercise_id: 3
      ),
      Category.create!(
        group_id: 2,
        exercise_id: 3
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
