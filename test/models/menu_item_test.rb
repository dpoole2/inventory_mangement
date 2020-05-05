require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Menu Item Creation" do
    Ingredient.create(id: "21", name: "Ketchup", amount: 15)
    Menu_Item.create(ingredients_id: [2,3,4,21], menu_item_id: 32, menu_item_name: "Ham and Turkey Sandwich")
    x = Menu_Item.last
    assert x.ingredient_id == [2,3,4,21] && x.menu_item_id == 32 && x.menu_item_name == "Ham and Turkey Sandwich"
  end


  test "Menu Item Deletion" do
    Ingredient.create(id: "21", name: "Ketchup", amount: 15)
    Menu_Item.create(ingredients_id: [2,3,4,21], menu_item_id: 32, menu_item_name: "Ham and Turkey Sandwich")
    x = Menu_Item.last
    x.destroy
    assert !Menu_Item.find(menu_item).present?
  end


  test "Menu Item Edit" do
    Ingredient.create(id: "21", name: "Ketchup", amount: 15)
    Menu_Item.create(ingredients_id: [2,3,4,21], menu_item_id: 32, menu_item_name: "Ham and Turkey Sandwich")
    x = Menu_Item.find_by(id: Menu_Item.id)
    x.menu_item_name = "Turkey with gravy"
    x.ingredients_id = [2,5]
    x.save(:validate => false)
    assert x.menu_item_name == "Turkey with gravy" && x.ingredients_id == [2,5]
  end

end
