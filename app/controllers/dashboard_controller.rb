
class DashboardController < ApplicationController
  protect_from_forgery

  def index

  end

  def find_by_ingredients

  end

  def random_recipe
    #begin
      apiRequest = ApiRequest.new
      response = apiRequest.random_recipe
      render 'random_recipe',:locals=>{:result=>response.body["recipes"]}
    #rescue
    #  render 'random_recipe',:locals=>{:result=>[]}
    #end
  end


  def consulta_receta
    begin
    search = params[:txtConsulta]
    apiRequest = ApiRequest.new
    response = apiRequest.find_by_ingredient search
    render 'consulta_receta',:locals=>{:result=>response.body,:ingredientes=>search}
    rescue
      render 'consulta_receta',:locals=>{:result=>[],:ingredientes=>""}
    end
  end

  def consulta_nutricion
    begin
      search = params[:txtConsulta]
      servings = params[:txtPorciones]
      #Url
      # https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/visualizeNutrition
      # These code snippets use an open-source library.
      apiRequest = ApiRequest.new
      response = apiRequest.post search,servings

      render 'consulta',:locals=>{:result=>response.body.html_safe,:ingredientes=>search,:porciones=>servings}
    rescue
      render 'consulta',:locals=>{:result=>"",:ingredientes=>"",:porciones=>""}
    end
  end

end