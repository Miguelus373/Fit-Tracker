require 'rails_helper'

RSpec.describe "exercises/edit", type: :view do
  before(:each) do
    @exercise = assign(:exercise, Exercise.create!(
      AuthorId: 1,
      Name: "MyString",
      Amount: 1
    ))
  end

  it "renders the edit exercise form" do
    render

    assert_select "form[action=?][method=?]", exercise_path(@exercise), "post" do

      assert_select "input[name=?]", "exercise[AuthorId]"

      assert_select "input[name=?]", "exercise[Name]"

      assert_select "input[name=?]", "exercise[Amount]"
    end
  end
end
