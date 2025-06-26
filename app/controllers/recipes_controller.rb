class RecipesController < ApplicationController
  def index
    query = params[:q].presence || "chicken"
    @recipes = RecipeFetcher.new(query).fetch
    @search_query = query
  end

  def show
    # Fetch by id for exact match
    recipe = fetch_by_id(params[:id])
    unless recipe
      render partial: "not_found", status: :not_found and return if request.xhr? || request.headers["X-Requested-With"] == "XMLHttpRequest"
      redirect_to recipes_path, alert: "Recipe not found." and return
    end
    @recipe = recipe
    if request.xhr? || request.headers["X-Requested-With"] == "XMLHttpRequest"
      render partial: "modal_content", locals: { recipe: @recipe }
    end
  end

  private

  def fetch_by_id(id)
    url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
    response = Net::HTTP.get(URI(url))
    data = JSON.parse(response)
    return nil unless data["meals"] && data["meals"].first
    meal = data["meals"].first
    {
      id: meal["idMeal"],
      title: meal["strMeal"],
      ingredients: RecipeFetcher.new("").send(:extract_ingredients, meal),
      instructions: meal["strInstructions"],
      source_url: meal["strSource"],
      image_url: meal["strMealThumb"]
    }
  rescue
    nil
  end
end
