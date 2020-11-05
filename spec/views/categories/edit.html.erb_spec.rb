require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      group_id: 1,
      exercise_id: 1
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input[name=?]", "category[group_id]"

      assert_select "input[name=?]", "category[exercise_id]"
    end
  end
end
