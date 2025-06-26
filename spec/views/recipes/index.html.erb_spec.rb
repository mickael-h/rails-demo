require 'rails_helper'

RSpec.describe "recipes/index.html.erb", type: :view do
  let(:recipes) do
    [
      {
        id: "52771",
        title: "Spicy Arrabiata Penne",
        ingredients: "penne rigate - 1 pound, olive oil - 1/4 cup, garlic - 3 cloves",
        instructions: "Bring a large pot of water to a boil...",
        source_url: "https://www.themealdb.com/meal/52771",
        image_url: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"
      }
    ]
  end

  before do
    assign(:recipes, recipes)
    assign(:search_query, "Arrabiata")
    render
  end

  it "renders the search form with the current query" do
    expect(rendered).to have_selector("form input[type='text'][value='Arrabiata']")
  end

  it "displays the recipe title, image, and ingredients" do
    expect(rendered).to include("Spicy Arrabiata Penne")
    expect(rendered).to include("penne rigate - 1 pound")
    expect(rendered).to include("olive oil - 1/4 cup")
    expect(rendered).to include("garlic - 3 cloves")
    expect(rendered).to include("https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")
  end
end
