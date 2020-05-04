require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  #Testing by Dylan Poole

  test "Item creation" do
    Item.create(name: "Pickle", amount:5)
    item = Item.last
    assert item.name == "Pickle" && item.amount == 5
  end

  test "Item Deletion" do
    Item.create(name: "Pickle", amount:5)
    item_id = Item.last.id


    item.last.destroy
    assert !Item.find(item).present?
  end

  test "Item count" do
    Item.create(name: "Pickle", amount:5)
    item_map = Item.item_count
    assert item_map[item.name] == 5
  end

  test "Item unit" do
    array = Item.unit
    assert array == ['Ounce', 'Cup', 'Liter', 'Gram',
       'Kilogram', 'Pound',
       'Fluid ounce', 'Teaspoon', 
       'Tablespoon']
  end

  test "Item edit" do
    Item.create(name: "Pickle", amount:5)
    item = Item.last
    assert item.name == "Pickle" && item.amount == 5
    x = Item.find_by(id: item.id)
    x.name = "Beef"
    x.save(:validate => false)    
    assert item.name == "Beef" && item.amount == 5
  end

  test "Item creation part two" do
    Item.create(name: "Pickle", amount:5, food: true)
    item = Item.last
    assert item.name == "Pickle" && item.amount == 5 && item.food
  end



end
