require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      title: "MyString",
      director: "MyString",
      storyline: "MyString"
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[director]"

      assert_select "input[name=?]", "movie[storyline]"
    end
  end
end
