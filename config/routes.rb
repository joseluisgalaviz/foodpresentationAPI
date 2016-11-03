Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dashboard'=>'dashboard#index'
  post 'dashboard/consulta_nutricion' => 'dashboard#consulta_nutricion'
  get 'dashboard/find_by_ingredients' => 'dashboard#find_by_ingredients'
  post 'dashboard/consulta_receta' => 'dashboard#consulta_receta'
  get 'dashboard/random_recipe'=>'dashboard#random_recipe'
end
