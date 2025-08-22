class RecipesController < ApplicationController
  def index
    query = params[:q].presence || "chicken"
    @recipes = RecipeFetcher.new(query).fetch
    @search_query = query
    
    respond_to do |format|
      format.html
      format.json { render json: { recipes: @recipes, search_query: @search_query } }
    end
  end

  def show
    # Fetch by id for exact match
    recipe = fetch_by_id(params[:id])
    unless recipe
      respond_to do |format|
        format.html { redirect_to recipes_path, alert: "Recipe not found." }
        format.json { render json: { error: "Recipe not found" }, status: :not_found }
      end
      return
    end
    
    respond_to do |format|
      format.html { @recipe = recipe }
      format.json { render json: { recipe: recipe } }
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
