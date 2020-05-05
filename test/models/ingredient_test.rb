require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

#Testing by Neil Phillip Gloria

  test "Ingredient Creation" do
    Ingredient.create(id: "21", name: "Ketchup", amount: 15)
    x = Ingredient.last
    assert x.id == "21" && x.name == "Ketchup" && x.amount == 15
  end


  test "Ingredient Count" do
    Ingredient.create(id: "21", name: "Ketchup", amount: 15)
    x = Ingredient.count
    assert x.amount == 15
  end


  test "Ingredient Deletion" do
    Ingredient.create(id: "21", name: "Ketchup", amount: 15)
    x = Ingredient.last
    x.destroy
    assert !Ingredient.find(ingredient).present?
  end


  test "Ingredient Edit" do
    Ingredient.create(id: "21", name: "Ketchup", amount: 15)
    x = Ingredient.find_by(id: Ingredient.id)
    x.name = "Mustard"
    x.amount = 12
    x.save(:validate => false)
    assert x.name == "Mustard" && x.amount == 12 && x.id == 21
  end

end
