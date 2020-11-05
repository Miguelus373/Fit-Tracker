require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      group_id: 1,
      exercise_id: 1
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input[name=?]", "category[group_id]"

      assert_select "input[name=?]", "category[exercise_id]"
    end
  end
end
