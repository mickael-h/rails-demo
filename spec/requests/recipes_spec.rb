require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /recipes" do
    let(:api_response) do
      {
        "meals" => [
          {
            "idMeal" => "52771",
            "strMeal" => "Spicy Arrabiata Penne",
            "strInstructions" => "Bring a large pot of water to a boil...",
            "strSource" => "https://www.themealdb.com/meal/52771",
            "strMealThumb" => "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg",
            "strIngredient1" => "penne rigate",
            "strMeasure1" => "1 pound",
            "strIngredient2" => "olive oil",
            "strMeasure2" => "1/4 cup",
            "strIngredient3" => "garlic",
            "strMeasure3" => "3 cloves",
            "strIngredient4" => "",
            "strMeasure4" => "",
          }
        ]
      }.to_json
    end

    before do
      allow(Net::HTTP).to receive(:get).and_return(api_response)
    end

    it "returns http success and displays default recipes" do
      get recipes_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Spicy Arrabiata Penne")
      expect(response.body).to include("penne rigate - 1 pound")
      expect(response.body).to include("olive oil - 1/4 cup")
      expect(response.body).to include("garlic - 3 cloves")
    end

    it "returns http success and displays searched recipes" do
      get recipes_path, params: { q: "Arrabiata" }
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Spicy Arrabiata Penne")
      expect(response.body).to include("penne rigate - 1 pound")
      expect(response.body).to include("olive oil - 1/4 cup")
      expect(response.body).to include("garlic - 3 cloves")
    end

    it "shows a message if no recipes are found" do
      allow(Net::HTTP).to receive(:get).and_return({ "meals" => nil }.to_json)
      get recipes_path, params: { q: "nonexistent" }
      expect(response.body).to include("No recipes found for 'nonexistent'")
    end
  end
end
