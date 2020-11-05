require 'rails_helper'

RSpec.describe "exercises/show", type: :view do
  before(:each) do
    @exercise = assign(:exercise, Exercise.create!(
      AuthorId: 2,
      Name: "Name",
      Amount: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3/)
  end
end
