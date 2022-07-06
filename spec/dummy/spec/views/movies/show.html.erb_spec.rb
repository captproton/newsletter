require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      title: "Title",
      director: "Director",
      storyline: "Storyline"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Director/)
    expect(rendered).to match(/Storyline/)
  end
end
