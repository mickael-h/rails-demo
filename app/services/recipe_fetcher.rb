require "net/http"
require "json"

class RecipeFetcher
  API_URL = "https://www.themealdb.com/api/json/v1/1/search.php?s="

  def initialize(query)
    @query = query
  end

  def fetch
    uri = URI(API_URL + URI.encode_www_form_component(@query))
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    return [] unless data["meals"]

    data["meals"].map do |meal|
      {
        id: meal["idMeal"],
        title: meal["strMeal"],
        ingredients: extract_ingredients(meal),
        instructions: meal["strInstructions"],
        source_url: meal["strSource"],
        image_url: meal["strMealThumb"]
      }
    end
  end

  private

  def extract_ingredients(meal)
    (1..20).map do |i|
      ingredient = meal["strIngredient#{i}"]
      measure = meal["strMeasure#{i}"]
      next if ingredient.nil? || ingredient.strip.empty?
      "#{ingredient} - #{measure}".strip
    end.compact.join(", ")
  end
end
