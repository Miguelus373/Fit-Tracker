require 'rails_helper'

RSpec.describe "exercises/new", type: :view do
  before(:each) do
    assign(:exercise, Exercise.new(
      AuthorId: 1,
      Name: "MyString",
      Amount: 1
    ))
  end

  it "renders new exercise form" do
    render

    assert_select "form[action=?][method=?]", exercises_path, "post" do

      assert_select "input[name=?]", "exercise[AuthorId]"

      assert_select "input[name=?]", "exercise[Name]"

      assert_select "input[name=?]", "exercise[Amount]"
    end
  end
end
