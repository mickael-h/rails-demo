require 'rails_helper'
require 'net/http'

RSpec.describe RecipeFetcher do
  let(:query) { 'Arrabiata' }
  let(:service) { described_class.new(query) }

  let(:api_response) do
    {
      "meals" => [
        {
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

  it 'returns an array of recipes with expected attributes' do
    recipes = service.fetch
    expect(recipes).to be_an(Array)
    expect(recipes.size).to eq(1)
    recipe = recipes.first
    expect(recipe[:title]).to eq('Spicy Arrabiata Penne')
    expect(recipe[:instructions]).to include('Bring a large pot of water')
    expect(recipe[:source_url]).to eq('https://www.themealdb.com/meal/52771')
    expect(recipe[:image_url]).to include('ustsqw1468250014.jpg')
    expect(recipe[:ingredients]).to include('penne rigate')
    expect(recipe[:ingredients]).to include('olive oil')
    expect(recipe[:ingredients]).to include('garlic')
  end

  it 'returns an empty array if no meals are found' do
    allow(Net::HTTP).to receive(:get).and_return({ "meals" => nil }.to_json)
    recipes = service.fetch
    expect(recipes).to eq([])
  end
end 
