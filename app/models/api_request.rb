
class ApiRequest

  def post( ingredient,servings )
    response = Unirest.post "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/visualizeNutrition",
                            headers:{
                                "X-Mashape-Key" => "jW9u7AKBwamshJE16K2HiadGlpZdp1lgOGzjsnRXDtTGNvKvSW",
                                "Accept" => "text/html",
                                "Content-Type" => "application/x-www-form-urlencoded"
                            },
                            parameters:{
                                "defaultCss" => true,
                                "ingredientList" => ingredient,
                                "servings" => servings,
                                "showBacklink" => true
                            }
  end

  def find_by_ingredient(ingredients)
    # These code snippets use an open-source library.
    response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=false&ingredients=#{CGI::escape(ingredients)}&limitLicense=false&number=5&ranking=1",
                           headers:{
                               "X-Mashape-Key" => "jW9u7AKBwamshJE16K2HiadGlpZdp1lgOGzjsnRXDtTGNvKvSW",
                               "Accept" => "application/json"
                           }
  end

  def random_recipe
    # These code snippets use an open-source library. http://unirest.io/ruby
    response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/random?limitLicense=false&number=1",
                           headers:{
                               "X-Mashape-Key" => "jW9u7AKBwamshJE16K2HiadGlpZdp1lgOGzjsnRXDtTGNvKvSW",
                               "Accept" => "application/json"
                           }
  end
end
